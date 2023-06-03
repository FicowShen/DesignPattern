import Foundation

class TouchScreen: Screen {
    
    let content: String
    
    init(content: String) {
        self.content = content
    }
    
    func displayContent() -> String {
        return content
    }
}

class iPhone: Phone {
    
    var screen: Screen
    
    init(screen: Screen) {
        self.screen = screen
    }
}
