import Foundation

class BombedWall: Wall {
    override func clone() -> Wall { return BombedWall() }
}

class RoomWithABomb: Room {
    override func clone() -> Room { return RoomWithABomb(roomNumber: roomNumber) }
}

class BombedMazeGame: MazeGame {
    static func makeWall() -> Wall {
        return BombedWall()
    }
    
    static func makeRoom(roomNumber: Int) -> Room {
        return RoomWithABomb(roomNumber: roomNumber)
    }
}
