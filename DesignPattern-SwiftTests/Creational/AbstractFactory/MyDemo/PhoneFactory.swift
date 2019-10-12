import Foundation

protocol PhoneFactory {
    func makePhone() -> Phone
}

class NokiaPhoneFactory: PhoneFactory {
    func makePhone() -> Phone {
        return NokiaPhone()
    }
}

class iPhoneFactory: PhoneFactory {
    func makePhone() -> Phone {
        return iPhone()
    }
}
