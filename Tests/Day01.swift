import Testing

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day01Tests {
  // Smoke test data provided in the challenge question
  let testData = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """

  @Test func testPart1TestData() async throws {
    let challenge = Day01(data: testData)
    #expect(String(describing: challenge.part1()) == "11")
  }
  
  @Test func testPart1RealData() async throws {
    let challenge = Day01(data: Day01.loadData(challengeDay: 1))
    #expect(String(describing: challenge.part1()) == "2164381")
  }

  @Test func testPart2TestData() async throws {
    let challenge = Day01(data: testData)
    #expect(String(describing: challenge.part2()) == "31")
  }
  
  @Test func testPart2RealData() async throws {
    let challenge = Day01(data: Day01.loadData(challengeDay: 1))
    #expect(String(describing: challenge.part2()) == "20719933")
  }
}
