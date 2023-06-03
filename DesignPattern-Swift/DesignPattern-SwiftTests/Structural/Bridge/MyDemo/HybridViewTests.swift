import XCTest
@testable import DesignPattern_Swift

class HybridViewTests: XCTestCase {

    func testHybridView() {
        let view = SquaredButton()
        XCTAssertTrue(view.imp is MacViewImp)
    }
}
