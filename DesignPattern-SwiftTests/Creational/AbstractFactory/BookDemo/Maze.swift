import Foundation

class Maze {
    
    private var rooms = [Room]()
    
    func addRoom(_ room: Room) {
        rooms.append(room)
    }
    
    func roomWithRoomNumber(_ roomNumber: Int) -> Room? {
        return rooms.first(where: { $0.roomNumber == roomNumber })
    }
    
    static func createMaze() -> Maze {
        let maze = Maze()
        let room1 = Room(roomNumber: 1)
        let room2 = Room(roomNumber: 2)
        let door = Door(room: room1, anotherRoom: room2)
        
        maze.addRoom(room1)
        maze.addRoom(room2)
        
        room1.setSide(Wall(), forDirection: .north)
        room1.setSide(door, forDirection: .west)
        room1.setSide(Wall(), forDirection: .south)
        room1.setSide(Wall(), forDirection: .east)
        
        room2.setSide(Wall(), forDirection: .north)
        room2.setSide(Wall(), forDirection: .west)
        room2.setSide(Wall(), forDirection: .south)
        room2.setSide(door, forDirection: .east)
        
        return maze
    }
    
    static func createMaze(factory: MazeFactory) -> Maze {
        let maze = factory.makeMaze()
        let room1 = factory.makeRoom(roomNumber: 1)
        let room2 = factory.makeRoom(roomNumber: 2)
        let door = factory.makeDoor(room: room1, anotherRoom: room2)
        
        maze.addRoom(room1)
        maze.addRoom(room2)
        
        room1.setSide(factory.makeWall(), forDirection: .north)
        room1.setSide(door, forDirection: .west)
        room1.setSide(factory.makeWall(), forDirection: .south)
        room1.setSide(factory.makeWall(), forDirection: .east)
        
        room2.setSide(factory.makeWall(), forDirection: .north)
        room2.setSide(factory.makeWall(), forDirection: .west)
        room2.setSide(factory.makeWall(), forDirection: .south)
        room2.setSide(door, forDirection: .east)
        
        return maze
    }
}
