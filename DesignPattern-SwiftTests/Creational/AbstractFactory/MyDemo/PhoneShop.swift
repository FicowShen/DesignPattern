import Foundation

class PhoneShop {
    static func makePhone(factory: PhoneFactory) -> Phone {
        return factory.makePhone()
    }
}
