import UIKit
import Foundation

//Task#1 Disemvowel Trolls - delete vowels from string
var str = "Hello, playground"

func disemvowel(_ s: String) -> String {
  return s.replacingOccurrences(of: "[aeiou]", with: "", options: [.regularExpression, .caseInsensitive])
}


//Task#2
func digitalRoot(of number: Int) -> Int {
    if(number / 10 == 0) {
        return number
    }
    
    var reminder: Int = 0
    var afterDiv: Int = 0
    
    afterDiv = number / 10
    reminder = number - afterDiv * 10
    print("\(afterDiv) + \(reminder)")
    
    let newNumber: Int = afterDiv + reminder
    print(newNumber)
    return digitalRoot(of: newNumber)
}

//Task#3
/*
 Write a function that will return the count of
    distinct case-insensitive
    alphabetic characters
    and numeric digits
    that occur more than once in the input string.
 */
/*
 вернуть количество повторяющихся символов
 */

//my solution
func countDuplicates(_ s:String) -> Int {
   
    var tempStr: String = s.replacingOccurrences(of: "[ ,.;:]", with: "", options: [.regularExpression, .caseInsensitive])
    if tempStr.isEmpty {
        return 0
    }
    var tempIndex: String.Index = tempStr.startIndex
    var tempChar: Character = tempStr[tempIndex]
    var tempRange: Range = tempStr.index(after: tempStr.startIndex)..<tempStr.endIndex
    var offset = 0
    var result = 0
    
    if(tempIndex == tempStr.index(before: tempStr.endIndex)) {
        return 0
    }
    
    repeat {
        
        //if found dublicate, delete them, set temps to init values
        if tempStr[tempRange].range(of: String(tempChar), options: .caseInsensitive) != nil && tempChar.isASCII && (tempChar.isNumber || tempChar.isLetter) {
            print(tempChar)
            result += 1
            tempStr = tempStr.replacingOccurrences(of: String(tempChar), with: "", options: [.regularExpression, .caseInsensitive])
            if tempStr.isEmpty {
                return result
            }
            tempRange = tempStr.index(after: tempStr.startIndex)..<tempStr.endIndex
            tempIndex = tempStr.startIndex
            offset = 0
        } else {
            offset += 1
        }
          
        //in any case set new index
        tempIndex = tempStr.index(s.startIndex, offsetBy: offset)
        
        //check it on the eos
        if(tempIndex == tempStr.index(before: tempStr.endIndex)) {
            print("returned when eos")
            return result
        }
        
        //if not eos set temp range and char
        tempRange = tempStr.index(after: tempIndex)..<tempStr.endIndex
        tempChar = tempStr[tempIndex]
        print("temp char: \(tempChar)")
    } while(true)
}


//best soultion
func countDuplicatesBest1(_ s:String) -> Int {
    var counts: [String: Int] = [:]
    for character in Array(s) {
        counts[character.lowercased(), default: 0] += 1
    }
    return counts.values.filter{ $0 > 1 }.count
}

//or
func countDuplicatesBest2(_ s:String) -> Int {
  return s.lowercased().reduce(into: [:]) { $0[$1, default: 0] += 1 }.filter { $0.1 > 1 }.count
}

//Task#4 вернуть кортеж индексов чисел которые в сумме составляют целевое значение
class Solution {
  static func twosum(numbers: [Double], target: Double) -> [Int] {
    let sub = numbers.map {-($0 - target)}
    var counter = 0
    var matched: [Int]
    repeat {
        matched = numbers.enumerated().filter {$0.element.isEqual(to: sub[counter])}.map{$0.offset}
        for match in matched {
            if match != counter {
                return [counter, match]
            }
        }
        
        counter += 1
    } while(counter < numbers.count)
    
     return []
  }
}


//best solution
class SolutionBest1 {
    static func twosum(numbers: [Double], target: Double) -> [Int] {
        return numbers.enumerated().filter { a in
            numbers.enumerated().contains { a.offset != $0 && a.element + $1 == target }
        }.map { $0.offset }
    }
}


//Given a positive number n > 1 find the prime factor decomposition of n. The result will be a string with the following form :
//"(p1**n1)(p2**n2)...(pk**nk)"

func isPrime(_ possiblePrime: Int) -> Bool {
    for index in 2..<possiblePrime / 2 {
        if possiblePrime % index == 0 {
            return false
        }
    }
    return true
}

func factors(_ number: Int) -> String {

    var factorToPowerDict: [Int : Int] = [:]
    var numberToFactor = number
    for index in 2...numberToFactor {
        if numberToFactor % index == 0 {
            isPrime(index) {
                factorToPowerDict[index] += 1
            }
        }
    }
    
    func isPrime(_ possiblePrime: Int) -> Bool {
        for index in 2..<possiblePrime / 2 {
            if possiblePrime % index == 0 {
                return false
            }
        }
        return true
    }
}

isPrime(42)

let number = 25
// find a divider
//
//
