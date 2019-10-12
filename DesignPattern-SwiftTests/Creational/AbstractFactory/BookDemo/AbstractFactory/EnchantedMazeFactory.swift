import Foundation

class EnchantedRoom: Room {}

class DoorNeedingSpell: Door {}

class EnchantedMazeFactory: MazeFactory {
    
    func makeRoom(roomNumber: Int) -> Room {
        return EnchantedRoom(roomNumber: roomNumber)
    }
    
    func makeDoor(room: Room, anotherRoom: Room) -> Door {
        return DoorNeedingSpell(room: room, anotherRoom: anotherRoom)
    }
}
