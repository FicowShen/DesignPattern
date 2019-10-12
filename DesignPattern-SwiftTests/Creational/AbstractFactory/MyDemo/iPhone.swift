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
    
    let screen: Screen
    
    init() {
        screen = TouchScreen(content: "Apple")
    }
}
