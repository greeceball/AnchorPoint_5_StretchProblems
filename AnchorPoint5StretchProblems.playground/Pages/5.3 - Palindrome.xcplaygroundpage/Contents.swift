//: [Longest Word](@previous)
/*:
 # Wednesday Stretch Problem 5.3
 ## Palindrome
 ### Instructions
 - Make a function that takes in a string and returns if it is a palindrome (true/false).
 ```
 palindrome("thanks") -> false
 palindrome("rAcecar") -> true
 ```
 - Then ignore spaces.
 ```
 palindrome("dammit im mad") -> true
 palindrome("this is totally a palindrome") -> false
 ```
 ### Black Diamond 💎💎💎
 - Ignore punctuation.
 */
import Foundation


func palindrome(stringToConvert: String) -> Bool {
    var stringToCheck = sanitize(stringToConvert)
    
    guard stringToCheck.count >= 2 else {
         return true
     }

    var stringReversed = String(stringToCheck.reversed())
    if stringReversed == stringToCheck {
        return true
    }
    return false
}

func sanitize(_ value: String) -> String
{
    return value.lowercased().replacingOccurrences(of: "[^a-z]+", with: "", options: .regularExpression)
}

palindrome(stringToConvert: "dammit i'm mad")




//: [Greatest Common Divisor](@next)
