import Testing

@testable import AdventOfCode

struct Day03Tests {
  // Smoke test data provided in the challenge question
  let part1TestData = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
  let part2TestData = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

  @Test func testPart1TestData() async throws {
    let challenge = Day03(data: part1TestData)
    #expect(String(describing: challenge.part1()) == "161")
  }
  
  @Test func testPart1RealData() async throws {
    let challenge = Day03(data: Day03.loadData(challengeDay: 3))
    #expect(String(describing: challenge.part1()) == "174103751")
  }

  @Test func testPart2TestData() async throws {
    let challenge = Day03(data: part2TestData)
    #expect(String(describing: challenge.part2()) == "48")
  }
  
  @Test func testPart2RealData() async throws {
    let challenge = Day03(data: Day03.loadData(challengeDay: 3))
    #expect(String(describing: challenge.part2()) == "100411201")
  }
}
