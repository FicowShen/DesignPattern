import Foundation

class PhoneShop {
    static func makePhone(factory: PhoneFactory) -> Phone {
        let screen = factory.makeScreen()
        let phone = factory.makePhone(screen: screen)
        return phone
    }
}
