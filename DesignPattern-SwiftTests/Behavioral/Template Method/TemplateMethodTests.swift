import XCTest

final class TemplateMethodTests: XCTestCase {
    func testExample() {
        let view = MyView()
        view.display()
        XCTAssertTrue(view.didDisplay)
        XCTAssertTrue(view.didFocus)
    }
}
