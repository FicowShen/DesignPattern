import XCTest
@testable import DesignPattern_Swift

class WindowTests: XCTestCase {

    func testWindow() {
        let view = View()
        let window = ApplicationWindow(contents: view)
        XCTAssertTrue(view === window.getView())
        XCTAssertTrue(window.getWindowImp() is PMWindowImp)
    }
}
