import Foundation

extension Maze {
    static func createMaze(builder: MazeBuilder) -> Maze? {
        builder.buildMaze()
        
        builder.buildRoom(roomNumber: 1)
        builder.buildRoom(roomNumber: 2)
        
        builder.buildDoor(roomNumber: 1, anotherRoomNumber: 2)
        
        return builder.getMaze()
    }
}
