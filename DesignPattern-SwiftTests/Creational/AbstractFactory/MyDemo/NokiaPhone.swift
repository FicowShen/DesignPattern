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
    
    let screen: Screen
    
    init() {
        screen = NormalScreen(content: "Nokia")
    }
}
