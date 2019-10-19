import Foundation

class NormalScreen: Screen {
    
    let content: String
    
    init(content: String) {
        self.content = content
    }
    
    func displayContent() -> String {
        return content
    }
}

class NokiaPhone: Phone {
    
    var screen: Screen
    
    init(screen: Screen) {
        self.screen = screen
    }
}
