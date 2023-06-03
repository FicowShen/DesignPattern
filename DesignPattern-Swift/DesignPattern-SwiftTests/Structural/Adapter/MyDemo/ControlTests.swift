import XCTest
import struct UIKit.CGRect
@testable import DesignPattern_Swift


class ControlTests: XCTestCase {
    
    func testControl() {
        let control = Control(frame: .zero, isVisible: true, isInteractionEnabled: true)
        let respondableControl = RespondableControl(control: control)
        control.becomeFocused()
        XCTAssertTrue(respondableControl.isFirstResponder)
    }

    func testButton() {
        let button = Button(frame: .zero, isVisible: true, isInteractionEnabled: true)
        let respondableControl = RespondableControl(control: button)
        button.becomeFocused()
        XCTAssertTrue(respondableControl.isFirstResponder)
    }
    
    func testImageView() {
        let imageView = ImageView(frame: .zero, isVisible: true)
        XCTAssertFalse(imageView.canBeomeFirstResponder)
        imageView.isInteractionEnabled = true
        imageView.frame = .init(x: 0, y: 0, width: 10, height: 10)
        XCTAssertTrue(imageView.canBeomeFirstResponder)
    }
}
