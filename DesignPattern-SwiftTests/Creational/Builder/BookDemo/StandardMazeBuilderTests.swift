import XCTest

class StandardMazeBuilderTests: XCTestCase {

    func testStandardMazeBuilder() {
        let builder = StandardMazeBuilder()
        guard let maze = Maze.createMaze(builder: builder) else {
            XCTFail()
            return
        }
        guard let room1 = maze.roomWithRoomNumber(1),
            let room2 = maze.roomWithRoomNumber(2) else {
            XCTFail()
            return
        }
        XCTAssertTrue(room1.sideForDirection(.east) is Door)
        XCTAssertTrue(room2.sideForDirection(.west) is Door)
    }

}
