import Foundation

class Room: MapSite {
    
    let roomNumber: Int
    private var sides = [Direction: MapSite]()
    
    init(roomNumber: Int) {
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
