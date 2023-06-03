import XCTest
@testable import DesignPattern_Swift

class PhonePrototypeFactoryTests: XCTestCase {

    func testExample() {
        let screen = PrototypeScreen(content: "PrototypeScreen")
        let prototypeFactory = PhonePrototypeFactory(phone: FoldablePhone(screen: screen), screen: screen)
        let phone = PhoneShop.makePhone(factory: prototypeFactory)
        XCTAssertTrue(phone is FoldablePhone)
        XCTAssertTrue(phone.screen is PrototypeScreen)
        XCTAssertEqual(phone.screen.content, "PrototypeScreen")
    }
}
