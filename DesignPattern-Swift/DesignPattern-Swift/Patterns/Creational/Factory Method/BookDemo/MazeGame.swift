import Foundation

protocol MazeGame {
    static func createMaze() -> Maze?
    
    static func makeMaze() -> Maze
    static func makeRoom(roomNumber: Int) -> Room
    static func makeWall() -> Wall
    static func makeDoor(room: Room, anotherRoom: Room) -> Door
}

extension MazeGame {
    
    static func makeMaze() -> Maze {
        return Maze()
    }
    
    static func makeRoom(roomNumber: Int) -> Room {
        return Room(roomNumber: roomNumber)
    }
    
    static func makeWall() -> Wall {
        return Wall()
    }
    
    static func makeDoor(room: Room, anotherRoom: Room) -> Door {
        return Door(room: room, anotherRoom: anotherRoom)
    }
    
    static func createMaze() -> Maze? {
        let maze = makeMaze()
        
        let room1 = makeRoom(roomNumber: 1)
        let room2 = makeRoom(roomNumber: 2)
        let door = makeDoor(room: room1, anotherRoom: room2)
        
        maze.addRoom(room1)
        maze.addRoom(room2)
        
        room1.setSide(makeWall(), forDirection: .north)
        room1.setSide(door, forDirection: .east)
        room1.setSide(makeWall(), forDirection: .south)
        room1.setSide(makeWall(), forDirection: .west)
        
        room1.setSide(makeWall(), forDirection: .north)
        room1.setSide(makeWall(), forDirection: .east)
        room1.setSide(makeWall(), forDirection: .south)
        room1.setSide(door, forDirection: .west)
        
        return maze
    }
}
