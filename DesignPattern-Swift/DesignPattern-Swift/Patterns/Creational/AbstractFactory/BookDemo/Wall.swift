import Foundation

class Wall: MapSite, Cloneable {
    func enter() {
        
    }
    
    func clone() -> Wall { return Wall() }
}
