import Foundation

class Door: MapSite, Cloneable {
    
    private(set) var room: Room
    private(set) var anotherRoom: Room
    var isOpen = false
    
    init(room: Room, anotherRoom: Room) {
        self.room = room
        self.anotherRoom = anotherRoom
    }
    
    func otherSideFromRoom(_ room: Room) -> Room {
        if room === self.room {
            return anotherRoom
        }
        return self.room
    }
    
    func initialize(room: Room, anotherRoom: Room) {
        self.room = room
        self.anotherRoom = anotherRoom
    }
    
    func enter() {
        
    }
    
    func clone() -> Door { return Door(room: room, anotherRoom: anotherRoom) }
}
