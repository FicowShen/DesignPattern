import Foundation

class BombedWall: Wall {}

class RoomWithABomb: Room {}

class BombedMazeGame: MazeGame {
    static func makeWall() -> Wall {
        return BombedWall()
    }
    
    static func makeRoom(roomNumber: Int) -> Room {
        return RoomWithABomb(roomNumber: roomNumber)
    }
}
