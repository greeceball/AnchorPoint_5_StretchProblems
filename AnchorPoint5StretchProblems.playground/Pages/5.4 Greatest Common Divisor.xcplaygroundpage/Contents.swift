//: [Palindrome](@previous)
/*:
 # Thursday Stretch Problem 5.4
 ## Greatest Common Divisor
 ### Instructions
 - Read about recursion.
 - Note Google's little joke when you search recursion in Chrome.
 - Create a function that returns the greatest common divisor of two numbers using recursion. (function calling itself).
 
 ### Black Diamond 💎💎💎
 - Go back to past stretch problems that have used loops and redo them using recursion.
 */
import Foundation

func greatestCommonDivisor( number1: Int, number2: Int) -> Int {
    
    if number2 == 0 && number1 == 0{
        return 0
    } else {
        if number2 == 0{
            return number1
        } else {
            let tempNumber: Int = number1 % number2
            
            if tempNumber != 0 {
                return greatestCommonDivisor(number1: number2, number2: tempNumber)
            } else {
                return number2
            }
        }
    }
}

print(greatestCommonDivisor(number1: 52, number2: 39))

