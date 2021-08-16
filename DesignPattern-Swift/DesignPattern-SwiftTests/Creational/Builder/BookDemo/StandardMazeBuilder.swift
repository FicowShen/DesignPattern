import Foundation

class StandardMazeBuilder: MazeBuilder {
    
    private let currentMaze: Maze
    
    init() {
        currentMaze = Maze()
    }
    
    func getMaze() -> Maze? {
        return currentMaze
    }
    
    func buildRoom(roomNumber: Int) {
        guard currentMaze.roomWithRoomNumber(roomNumber) == nil else { return }
        let room = Room(roomNumber: roomNumber)
        currentMaze.addRoom(room)
        
        Direction.allCases.forEach {
            room.setSide(Wall(), forDirection: $0)
        }
    }
    
    func buildDoor(roomNumber: Int, anotherRoomNumber: Int) {
        guard let room1 = currentMaze.roomWithRoomNumber(roomNumber), let room2 = currentMaze.roomWithRoomNumber(anotherRoomNumber) else { return }
        let door = Door(room: room1, anotherRoom: room2)
        room1.setSide(door, forDirection: .east)
        room2.setSide(door, forDirection: .west)
    }
}
