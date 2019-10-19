import Foundation

protocol PhoneFactory {
    func makeScreen() -> Screen
    func makePhone(screen: Screen) -> Phone
}

class NokiaPhoneFactory: PhoneFactory {
    
    func makeScreen() -> Screen {
        return NormalScreen(content: "Nokia")
    }
    
    func makePhone(screen: Screen) -> Phone {
        return NokiaPhone(screen: screen)
    }
}

class iPhoneFactory: PhoneFactory {
    
    func makeScreen() -> Screen {
        return TouchScreen(content: "iPhone")
    }
    
    func makePhone(screen: Screen) -> Phone {
        return iPhone(screen: screen)
    }
}
