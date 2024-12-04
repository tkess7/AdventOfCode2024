import Testing

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
struct Day02Tests {
  // Smoke test data provided in the challenge question
  let testData = """
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
    """

  @Test func testPart1TestData() async throws {
    let challenge = Day02(data: testData)
    #expect(String(describing: challenge.part1()) == "2")
  }
  
  @Test func testPart1RealData() async throws {
    let challenge = Day02(data: Day02.loadData(challengeDay: 2))
    #expect(String(describing: challenge.part1()) == "490")
  }

  @Test func testPart2TestData() async throws {
    // TODO: implement test with test data
  }
  
  @Test func testPart2RealData() async throws {
    // TODO: implement test with real data
  }
}
