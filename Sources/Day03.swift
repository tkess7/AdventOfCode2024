import Foundation
import RegexBuilder

struct Day03: AdventDay {
  let sourceData: String
  
  init(data: String) {
    self.sourceData = data
  }
  
  func part1() -> Int {
    let firstNumber = Reference(Int.self)
    let secondNumber = Reference(Int.self)
    
    let regex = Regex {
      "mul("
      
      Capture(as: firstNumber) {
        OneOrMore(.digit)
      } transform: { outputValue in
        return Int(outputValue)!
      }
      
      ","
      
      Capture(as: secondNumber) {
        OneOrMore(.digit)
      } transform: { outputValue in
        return Int(outputValue)!
      }
      
      ")"
    }
    
    let result = sourceData
      .matches(of: regex).map { result in
        let firstNumber = result.1
        let secondNumber = result.2
        return (firstNumber, secondNumber)
      }
      .map { firstNumber, secondNumber in
        return firstNumber * secondNumber
      }
      .reduce(0, +)
    return result
  }
  
  func part2() -> Int {
    let firstNumber = Reference(Int.self)
    let secondNumber = Reference(Int.self)
    
    let regex = Regex {
      ChoiceOf {
        Regex {
          "mul("
          
          Capture(as: firstNumber) {
            OneOrMore(.digit)
          } transform: { outputValue in
            return Int(outputValue)!
          }
          
          ","
          
          Capture(as: secondNumber) {
            OneOrMore(.digit)
          } transform: { outputValue in
            return Int(outputValue)!
          }
          
          ")"
        }
        "do()"
        "don't()"
      }
    }
    
    var ignore = false
    let result = sourceData
      .matches(of: regex).compactMap { (result) -> (Int, Int)? in
        switch result.output.0 {
        case "do()":
          ignore = false
          return nil
        case "don't()":
          ignore = true
          return nil
        default:
          return ignore ? nil : (result[firstNumber], result[secondNumber])
        }
      }
      .map { firstNumber, secondNumber in
        return firstNumber * secondNumber
      }
      .reduce(0, +)
    return result
  }
}
