import Foundation

class PhoneShop {
    static func makePhone(factory: PhoneFactory) -> Phone {
        let screen = factory.makeScreen(content: "Apple")
        var phone = factory.makePhone(model: "iPhone")
        phone.screen = screen
        return phone
    }
}
