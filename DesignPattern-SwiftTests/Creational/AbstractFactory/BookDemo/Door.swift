import Foundation

class Door: MapSite {
    
    private let room: Room
    private let anotherRoom: Room
    private var isOpen = false
    
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
    
    func enter() {
        
    }
}
