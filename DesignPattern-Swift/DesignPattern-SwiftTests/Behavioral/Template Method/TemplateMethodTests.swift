import XCTest
@testable import DesignPattern_Swift

final class TemplateMethodTests: XCTestCase {
    func testExample() {
        let view = MyView()
        view.display()
        XCTAssertTrue(view.didDisplay)
        XCTAssertTrue(view.didFocus)
    }
}
