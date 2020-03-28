import XCTest

class HelpHandlerTests: XCTestCase {
    func testExample() {
        let app = HelpHandler.Application(topic: .help(name: "app"))
        let dialog = HelpHandler.Widget.Dialog(handler: app,
                                               topic: .help(name: "dialog"))
        var didShowDialogHelp = false
        dialog.customizedHelp = {
            didShowDialogHelp = true
        }
        let button = HelpHandler.Widget.Button(parent: dialog,
                                               topic: .noHelp)
        button.handleHelp()
        XCTAssertTrue(didShowDialogHelp)
    }
}
