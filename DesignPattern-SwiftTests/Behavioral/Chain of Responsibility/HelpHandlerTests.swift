import XCTest

class HelpHandlerTests: XCTestCase {
    func testExample() {
        let app = ChainApplication(topic: .help(name: "app"))
        let dialog = ChainDialog(handler: app, topic: .help(name: "dialog"))
        var didShowDialogHelp = false
        dialog.customizedHelp = {
            didShowDialogHelp = true
        }
        let button = ChainButton(parent: dialog, topic: .noHelp)
        button.handleHelp()
        XCTAssertTrue(didShowDialogHelp)
    }
}



