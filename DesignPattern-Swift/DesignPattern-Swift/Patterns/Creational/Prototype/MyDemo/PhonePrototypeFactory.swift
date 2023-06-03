import Foundation

class PrototypePhone: Phone, Cloneable {
    
    var screen: Screen
    
    init(screen: Screen) {
        self.screen = screen
    }
    
    func initialize(screen: Screen) {
        self.screen = screen
    }
    
    func clone() -> PrototypePhone {
        return PrototypePhone(screen: screen)
    }
}

class FoldablePhone: PrototypePhone {
    override func clone() -> PrototypePhone {
        return FoldablePhone(screen: screen)
    }
}

class PrototypeScreen: Screen, Cloneable {
    
    private(set) var content: String
    
    init(content: String) {
        self.content = content
    }
    
    func displayContent() -> String {
        return content
    }
    
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
    
    func makeScreen() -> Screen {
        let newScreen = screen.clone()
        return newScreen
    }
    
    func makePhone(screen: Screen) -> Phone {
        let newPhone = phone.clone()
        newPhone.initialize(screen: screen)
        return newPhone
    }
}
