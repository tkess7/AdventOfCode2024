import Foundation

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var leftSide: [Int] = []
  var rightSide: [Int] = []
  
  init(data: String) {
    let rows = data.split(separator: "\n")
    
    for row in rows {
      let split = row.split(separator: " ")
      leftSide.append(Int(split.first!)!)
      rightSide.append(Int(split.last!)!)
    }
  }
  
  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Int {
    let sortedLeft = leftSide.sorted()
    let sortedRight = rightSide.sorted()
    
    let zipped = zip(sortedLeft, sortedRight)
    return zipped.map { left, right in
      return abs(left - right)
    }.reduce(0, +)
  }
  
  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Int {
    let right = Dictionary(rightSide.map { ($0, 1) }, uniquingKeysWith: +)
    print("ahh")
    return leftSide.map { leftSideValue in
      leftSideValue * right[leftSideValue, default: 0]
    }
    .reduce(0, +)
  }
}
