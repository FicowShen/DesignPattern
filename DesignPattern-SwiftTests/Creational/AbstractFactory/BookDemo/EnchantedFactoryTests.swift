import XCTest

class EnchantedFactoryTests: XCTestCase {

    func testEnchantedFactory() {
        let factory = EnchantedMazeFactory()
        let maze = Maze.createMaze(factory: factory)
        
        guard let room1 = maze.roomWithRoomNumber(1),
            let room2 = maze.roomWithRoomNumber(2) else {
            XCTFail()
            return
        }
        XCTAssertTrue(room1 is EnchantedRoom)
        XCTAssertTrue(room2 is EnchantedRoom)
        
        guard let door = room1.sideForDirection(.west) else {
            XCTFail()
            return
        }
        XCTAssertTrue(door is DoorNeedingSpell)
    }
}
