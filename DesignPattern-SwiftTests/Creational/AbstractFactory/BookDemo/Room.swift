import Foundation

class Room: MapSite {
    
    private(set) var roomNumber: Int
    private var sides = [Direction: MapSite]()
    
    init(roomNumber: Int) {
        self.roomNumber = roomNumber
    }
    
    func initialize(roomNumber: Int) {
        self.roomNumber = roomNumber
    }
    
    func sideForDirection(_ direction: Direction) -> MapSite? {
        return sides[direction]
    }
    
    func setSide(_ side: MapSite, forDirection direction: Direction) {
        sides[direction] = side
    }
    
    func enter() {
        
    }
}
