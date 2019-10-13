import XCTest

class CountingMazeBuilderTests: XCTestCase {

    func testCountingMazeBuilder() {
        let builder = CountingMazeBuilder()
        if let _ = Maze.createMaze(builder: builder) {
            XCTFail()
        }
        let (doors, rooms) = builder.getDoorAndRoomCount()
        XCTAssertEqual(doors, 1)
        XCTAssertEqual(rooms, 2)
    }
}
