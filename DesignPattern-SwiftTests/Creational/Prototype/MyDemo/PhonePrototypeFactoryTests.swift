import XCTest

class PhonePrototypeFactoryTests: XCTestCase {

    func testExample() {
        let prototypeFactory = PhonePrototypeFactory(phone: PrototypePhone(model: "Prototype Phone"), screen: PrototypeScreen(content: "Default Text"))
        let phone = PhoneShop.makePhone(factory: prototypeFactory)
        XCTAssertEqual(phone.model, "iPhone")
        XCTAssertEqual(phone.screen?.content, "Apple")
    }
}
