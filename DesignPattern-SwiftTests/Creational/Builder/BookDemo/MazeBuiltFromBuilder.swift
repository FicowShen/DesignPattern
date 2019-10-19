import Foundation

/// Director
class MazeCreator {
    func createMaze(builder: MazeBuilder) {
        builder.buildMaze()
        
        builder.buildRoom(roomNumber: 1)
        builder.buildRoom(roomNumber: 2)
        
        builder.buildDoor(roomNumber: 1, anotherRoomNumber: 2)
        
        builder.getMaze()
    }
    
    func createCountingMaze(builder: MazeBuilder) {
        builder.buildMaze()
        
        builder.buildRoom(roomNumber: 3)
        builder.buildRoom(roomNumber: 4)
        
        builder.buildDoor(roomNumber: 3, anotherRoomNumber: 4)
        
        builder.getMaze()
    }
}

extension Maze {
    static func createStandardMaze(creator: MazeCreator) -> Maze? {
        /// builder decides components of the building
        let builder = StandardMazeBuilder()
        /// director decides the building process
        creator.createMaze(builder: builder)
        return builder.getMaze()
    }
    
    static func createCountingMaze(creator: MazeCreator) -> (doorCount: Int, roomCount: Int) {
        let builder = CountingMazeBuilder()
        creator.createCountingMaze(builder: builder)
        return builder.getDoorAndRoomCount()
    }
}
