import XCTest

class CountingMazeBuilderTests: XCTestCase {

    func testCountingMazeBuilder() {
        let creator = MazeCreator()
        let mazeInfo = Maze.createCountingMaze(creator: creator)
        XCTAssertEqual(mazeInfo.doorCount, 1)
        XCTAssertEqual(mazeInfo.roomCount, 2)
    }
}
