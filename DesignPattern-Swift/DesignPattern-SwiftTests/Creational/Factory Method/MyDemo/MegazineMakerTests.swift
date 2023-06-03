import XCTest
@testable import DesignPattern_Swift

class MegazineMakerTests: XCTestCase {

    func testMegazineMaker() {
        guard let megazine = MegazineMaker.createBook() else {
            XCTFail()
            return
        }
        XCTAssertTrue(megazine.cover is HardCover)
        XCTAssertEqual(megazine.pages.count, 5)
        XCTAssertTrue(megazine.pages.first is ColorfulBookPage)
    }

}
