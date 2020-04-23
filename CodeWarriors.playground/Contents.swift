import UIKit
import Foundation

//Task#1 Disemvowel Trolls - delete vowels from string
var str = "Hello, playground"

func disemvowel(_ s: String) -> String {
  return s.replacingOccurrences(of: "[aeiou]", with: "", options: [.regularExpression, .caseInsensitive])
}


