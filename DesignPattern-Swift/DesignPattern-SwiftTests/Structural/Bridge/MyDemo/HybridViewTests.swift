import XCTest

class HybridViewTests: XCTestCase {

    func testHybridView() {
        let view = SquaredButton()
        XCTAssertTrue(view.imp is MacViewImp)
    }
}
