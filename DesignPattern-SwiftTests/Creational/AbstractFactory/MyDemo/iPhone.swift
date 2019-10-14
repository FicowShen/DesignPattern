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
    
    let model: String
    var screen: Screen?
    
    init(model: String) {
        self.model = model
    }
}
