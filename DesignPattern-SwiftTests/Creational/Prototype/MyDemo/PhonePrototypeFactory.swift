import Foundation

class PrototypePhone: Phone {
    var model: String
    var screen: Screen?
    
    init(model: String) {
        self.model = model
    }
    
    func initialize(model: String) {
        self.model = model
    }
}

extension PrototypePhone: Cloneable {
    func clone() -> PrototypePhone {
        return PrototypePhone(model: model)
    }
}

class PrototypeScreen: Screen {
    
    private(set) var content: String
    
    init(content: String) {
        self.content = content
    }
    
    func initialize(content: String) {
        self.content = content
    }
    
    func displayContent() -> String {
        return content
    }
}

extension PrototypeScreen: Cloneable {
    func clone() -> PrototypeScreen {
        return PrototypeScreen(content: content)
    }
}

class PhonePrototypeFactory: PhoneFactory {
    
    private let phone: PrototypePhone, screen: PrototypeScreen
    
    init(phone: PrototypePhone, screen: PrototypeScreen) {
        self.phone = phone
        self.screen = screen
    }
    
    func makeScreen(content: String) -> Screen {
        let newScreen = screen.clone()
        newScreen.initialize(content: content)
        return newScreen
    }
    
    func makePhone(model: String) -> Phone {
        let newPhone = phone.clone()
        newPhone.initialize(model: model)
        return newPhone
    }
}
