import XCTest
@testable import DesignPattern_Swift

class MazePrototypeFactoryTests: XCTestCase {

    func testMazePrototypeFactory() {
        let mazeFactory = MazePrototypeFactory(maze: Maze(), wall: BombedWall(), room: RoomWithABomb(roomNumber: 10), door: Door(room: Room(roomNumber: 10), anotherRoom: Room(roomNumber: 20)))
        let maze = Maze.createMaze(factory: mazeFactory)
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
