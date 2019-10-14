import Foundation

protocol Cloneable {
    associatedtype Copy
    func clone() -> Copy
}

extension Maze: Cloneable {
    func clone() -> Maze { return Maze() }
}

extension Wall: Cloneable {
    func clone() -> Wall { return Wall() }
}

extension Room: Cloneable {
    func clone() -> Room { return Room(roomNumber: roomNumber) }
}

extension Door: Cloneable {
    func clone() -> Door { return Door(room: room, anotherRoom: anotherRoom) }
}

class MazePrototypeFactory: MazeFactory {
    
    private let maze: Maze, wall: Wall, room: Room, door: Door
    
    init(maze: Maze, wall: Wall, room: Room, door: Door) {
        self.maze = maze
        self.wall = wall
        self.room = room
        self.door = door
    }
    
    func makeWall() -> Wall {
        return wall.clone()
    }
    
    func makeRoom(roomNumber: Int) -> Room {
        let newRoom = room.clone()
        newRoom.initialize(roomNumber: roomNumber)
        return newRoom
    }
    
    func makeDoor(room: Room, anotherRoom: Room) -> Door {
        let newDoor = door.clone()
        newDoor.initialize(room: room, anotherRoom: anotherRoom)
        return newDoor
    }
}
