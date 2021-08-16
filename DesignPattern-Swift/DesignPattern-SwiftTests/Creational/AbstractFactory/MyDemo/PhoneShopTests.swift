import XCTest

class PhoneShopTests: XCTestCase {

    func testNokiaPhoneFactory() {
        let nokiaFactory = NokiaPhoneFactory()
        let nokiaPhone = PhoneShop.makePhone(factory: nokiaFactory)
        XCTAssertTrue(nokiaPhone is NokiaPhone)
        XCTAssertTrue(nokiaPhone.screen is NormalScreen)
    }
    
    func testIPhoneFactory() {
        let iphoneFactory = iPhoneFactory()
        let iphone = PhoneShop.makePhone(factory: iphoneFactory)
        XCTAssertTrue(iphone is iPhone)
        XCTAssertTrue(iphone.screen is TouchScreen)
    }
}
