import Foundation

class CountingMazeBuilder: MazeBuilder {
    
    private var doors = 0
    private var rooms = 0
    
    func buildRoom(roomNumber: Int) {
        rooms += 1
    }
    
    func buildDoor(roomNumber: Int, anotherRoomNumber: Int) {
        doors += 1
    }
    
    func getDoorAndRoomCount() -> (doorCount: Int, roomCount: Int) {
        return (doors, rooms)
    }
}
