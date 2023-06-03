import Foundation

protocol MazeFactory {
    func makeMaze() -> Maze
    func makeWall() -> Wall
    func makeRoom(roomNumber: Int) -> Room
    func makeDoor(room: Room, anotherRoom: Room) -> Door
}

extension MazeFactory {
    func makeMaze() -> Maze {
        return Maze()
    }
    
    func makeWall() -> Wall {
        return Wall()
    }
    
    func makeRoom(roomNumber: Int) -> Room {
        return Room(roomNumber: roomNumber)
    }
    
    func makeDoor(room: Room, anotherRoom: Room) -> Door {
        return makeDoor(room: room, anotherRoom: anotherRoom)
    }
}
