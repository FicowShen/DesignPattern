import XCTest

class MazePrototypeFactoryTests: XCTestCase {

    func testMazePrototypeFactory() {
        let simpleMazeFactory = MazePrototypeFactory(maze: Maze(), wall: BombedWall(), room: RoomWithABomb(roomNumber: 1), door: Door(room: Room(roomNumber: 1), anotherRoom: Room(roomNumber: 2)))
        let simpleMaze = Maze.createMaze(factory: simpleMazeFactory)
        guard let room1 = simpleMaze.roomWithRoomNumber(1),
            let room2 = simpleMaze.roomWithRoomNumber(2) else {
            XCTFail()
            return
        }
        XCTAssertTrue(room1 is RoomWithABomb)
        XCTAssertTrue(room2 is RoomWithABomb)
        XCTAssertTrue(room1.sideForDirection(.east) is BombedWall)
    }
}
