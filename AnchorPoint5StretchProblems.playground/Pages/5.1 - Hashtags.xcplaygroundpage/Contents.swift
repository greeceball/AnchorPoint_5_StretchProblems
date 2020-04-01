/*:
 # Monday Stretch Problem 5.1
 ## Hashtags
 ### Instructions - Hashtags
 - Build a `Restaurant` model object with `name`, `streetAddress`, `city`, `state`, and `reviews` properties.
 - Build a `Review` model object with a `username` and `text` property.
 - Instantiate an array of `Restaurant` and `Review` objects. Make sure that each `Restaurant` object holds an array of reviews. Add hashtags to some of your reviews or restaruant descriptions. (Use Yelp or Google to help you come up with `Restaurants` and `Reviews`).
 - Add a `hashtags` computed property to the `Restaurant` object that returns an array of any hashtags in the `Restaurant` or `Review`.
 `- Check your computed property by printing a list of hashtags of each review and restaurant.
 
 ### Instructions - Searching
 - Add a `SearchableObject` protocol with one function `matchesSearchTerm(searchTerm: String)`.
 - Implement the function on both model objects.
 - Demonstrate your search by printing a list of `Restaurants` that match a variety of search terms.
 */
import Foundation

//Trevors Solution:
protocol SearchableObject {
    func matchesSearchTerm(_ searchTerm: String) -> Bool
}

struct Restaurant: SearchableObject {
    let name: String
    let description: String
    let streetAddress: String
    let city: String
    let state: String
    let reviews: [Review]
    var hashtags: [String] {
        var hashtagCollector = [String]()
        reviews.forEach { hashtagCollector.append(contentsOf: $0.hashtags) }
        return hashtagCollector
    }
    
    func matchesSearchTerm(_ searchTerm: String) -> Bool {
        if description.lowercased().contains(searchTerm.lowercased()) || hashtags.contains(searchTerm) {
            return true
        }
        for review in reviews where review.matchesSearchTerm(searchTerm) {
            return true
        }
        return false
    }
}

struct Review: SearchableObject {
    let username: String
    let text: String
    var hashtags: [String] {
        return text
            .split(separator: " ") // divide into `substrings`
            .map { String($0) } // turn back into `strings`
            .filter {  print($0, $0.hasPrefix("#")); return $0.hasPrefix("#") } // only keep #strings
    }
    
    func matchesSearchTerm(_ searchTerm: String) -> Bool {
        if hashtags.contains(searchTerm.lowercased()) || text.contains(searchTerm) {
            return true
        }
        return false
    }
}

let cubbyReviews = [Review(username: "R M Emerson Jr",
                           text: "The tri-tip steak sandwich with #BBQ is a food thing to behold."),
                    Review(username: "Jess N",
                           text: "It was quite busy during lunch but the line moves pretty quick.")]
let cubbys = Restaurant(name: "Cubby's",
                        description: "Cheery counter serve with a stylish interior offers burgers, salads & Chicago-style beef sandwiches.",
                        streetAddress: "700 North Thanksgiving Way d", city: "Lehi", state: "UT", reviews: cubbyReviews)


print(cubbys.matchesSearchTerm("#BBQ"))
print(cubbys.matchesSearchTerm("burgers"))

//// What im working on:
//class Restaurant {
//    var name: String
//    var streetAddress: String?
//    var city: String?
//    var state: String?
//    var review: [Review]?
//    var hashtags: [String]
//
//    init(name: String, streetAddress: String, city: String, state: String, review: [Review], hashtags:[String]){
//        self.name = name
//        self.streetAddress = streetAddress
//        self.city = city
//        self.state = state
//        self.review = review
//        self.hashtags = hashtags
//    }
//}
//
//class Review {
//    var username: String
//    var text: String
//
//    init(username:String, text: String){
//        self.username = username
//        self.text = text
//    }
//}
//
//var arrayOfRestuarants = [Restaurant]()
//
//let review1 = Review.init(username: "Sanka", text: "In Japan, heart surgeon. Number one. Steady hand. One day, Yakuza boss need new heart. I do operation. But, mistake! Yakuza boss die! Yakuza very mad. I hide in fishing boat, come to America. No english, no food, no money. Darryl give me job. Now I have house, American car, and new woman. Darryl save life. My big secret: I kill yakuza boss on purpose. I good surgeon. The best!")
//
//let jDawgs = ((Restaurant.init(name: "JDawgs", streetAddress: "321 MemoryLane", city: "Lehi", state: "Utah", review: <#[Review]#>, hashtags: "#jDawgs4Life!")


//: [Longest Word](@next)
