import XCTest

class PhonePrototypeFactoryTests: XCTestCase {

    func testExample() {
        let prototypeFactory = PhonePrototypeFactory(phone: FoldablePhone(model: "Prototype Phone"), screen: PrototypeScreen(content: "Default Text"))
        let phone = PhoneShop.makePhone(factory: prototypeFactory)
        XCTAssertTrue(phone is FoldablePhone)
        XCTAssertEqual(phone.model, "iPhone")
        XCTAssertEqual(phone.screen?.content, "Apple")
    }
}
