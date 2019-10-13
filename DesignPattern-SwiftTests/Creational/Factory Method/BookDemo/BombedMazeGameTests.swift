import XCTest

class BombedMazeGameTests: XCTestCase {

    func testBombedMazeGame() {
        guard let maze = BombedMazeGame.createMaze() else {
            XCTFail()
            return
        }
        guard let room1 = maze.roomWithRoomNumber(1),
            let room2 = maze.roomWithRoomNumber(2) else {
                XCTFail()
                return
        }
        
        XCTAssertTrue(room1 is RoomWithABomb)
        XCTAssertTrue(room2 is RoomWithABomb)
        
        XCTAssertTrue(room1.sideForDirection(.east) is BombedWall)
    }
}
