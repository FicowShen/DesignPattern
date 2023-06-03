import XCTest
@testable import DesignPattern_Swift

class CommandTests: XCTestCase {
    func testExample() {
        let app = CommandPattern.Application()
        let openCommand = OpenCommand(application: app)
        openCommand.response = "test"
        openCommand.execute()

        let receiver = MockReceiver()
        let simpleCommand = SimpleCommand(receiver: receiver)
        simpleCommand.execute()

        let macroCommand = MacroCommand()
        macroCommand.addCommand(openCommand)
        macroCommand.addCommand(simpleCommand)

        XCTAssertEqual(app.doc?.name, "test")
        XCTAssertTrue(receiver.didAction)
    }
}

private final class MockReceiver: CommandReceiver {

    private(set) var didAction = false

    func action() {
        didAction = true
    }
}
