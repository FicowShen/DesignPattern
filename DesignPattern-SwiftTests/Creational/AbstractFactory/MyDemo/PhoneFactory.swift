import Foundation

protocol PhoneFactory {
    func makeScreen(content: String) -> Screen
    func makePhone(model: String) -> Phone
}

class NokiaPhoneFactory: PhoneFactory {
    
    func makeScreen(content: String) -> Screen {
        return NormalScreen(content: content)
    }
    
    func makePhone(model: String) -> Phone {
        return NokiaPhone(model: model)
    }
}

class iPhoneFactory: PhoneFactory {
    
    func makeScreen(content: String) -> Screen {
        return TouchScreen(content: content)
    }
    
    func makePhone(model: String) -> Phone {
        return iPhone(model: model)
    }
}
