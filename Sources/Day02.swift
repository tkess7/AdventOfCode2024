import Foundation

struct Day02: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  let sourceData: String
  
  init(data: String) {
    self.sourceData = data
  }
  
  func part1() -> Int {
    return sourceData
      .split(separator: "\n")
      .compactMap { item -> [Int] in
        var rowArray: [Int] = []
        let row = item.split(separator: " ")
        for number in row {
          rowArray.append(Int(number)!)
        }
        return rowArray
      }
      .compactMap{ rowArray -> [Bool] in
        guard zip(rowArray, rowArray.dropFirst()).allSatisfy({ $0 < $1 }) || zip(rowArray, rowArray.dropFirst()).allSatisfy({ $0 > $1 }) else {
          return [false]
        }
        
        let resultArray = zip(rowArray, rowArray.dropFirst()).map { current, next in
          let diff = current - next
          return abs(diff) < 4
        }
        
        return resultArray
      }
      .compactMap { resultArray in
        resultArray.allSatisfy { $0 } ? true : nil
      }
      .count
  }
  
  func part2() {
    // TODO: implement
  }
}
