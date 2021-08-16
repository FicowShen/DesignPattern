import XCTest

class MediatorTests: XCTestCase {
    func testExample() {
        let director = FontDialogDirector()
        director.showDialog()
        XCTAssertEqual(director.displayingWidgets.count, 4)
        let cancelButton = director.displayingWidgets.last(where: { $0 is Mediator.Button })
        cancelButton?.handleMouse(.click)
        XCTAssertTrue(director.shouldDismissDialog)
    }
}
