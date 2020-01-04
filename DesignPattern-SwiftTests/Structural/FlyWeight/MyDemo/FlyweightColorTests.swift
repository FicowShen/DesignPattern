import XCTest

class FlyweightColorTests: XCTestCase {
    func testExample() {
        let colorFactory = FlyweightColorFactory()
        let color1 = colorFactory.createColor(name: .red)
        let color2 = colorFactory.createColor(name: .red)
        XCTAssertTrue(color1 === color2)
    }
}
