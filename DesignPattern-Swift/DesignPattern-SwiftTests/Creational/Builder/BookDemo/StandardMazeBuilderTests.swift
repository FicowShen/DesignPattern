import XCTest

class StandardMazeBuilderTests: XCTestCase {

    func testStandardMazeBuilder() {
        let creator = MazeCreator()
        guard let maze = Maze.createStandardMaze(creator: creator) else {
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
