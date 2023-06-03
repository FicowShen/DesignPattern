import XCTest
import UIKit
@testable import DesignPattern_Swift

class VisualComponentTests: XCTestCase {

    func testVisualComponent() {
        let window = VisualWindow()
        let textView = TextViewComponent()
        let scrollDecorator = ScrollDecorator(component: textView)
        let borderWidth: CGFloat = 1
        let borderDecorator = BorderDecorator(component: scrollDecorator,
                                              borderWidth: borderWidth)
        window.setContent(content: borderDecorator)
        
        let borderRect = CGRect(x: 0, y: 0, width: 10, height: 10)
        borderDecorator.draw(inRect: borderRect)
        
        guard let border = window.contents.first as? BorderDecorator
            else { XCTFail(); return }
        XCTAssertTrue(border === borderDecorator)
        guard let scroll = border.component as? ScrollDecorator
            else { XCTFail(); return }
        XCTAssertTrue(scroll === scrollDecorator)
        guard let view = scroll.component as? TextViewComponent
            else { XCTFail(); return }
        XCTAssertTrue(view === textView)
        guard let rect = view.rect
            else { XCTFail(); return }
        XCTAssertEqual(borderRect.insetBy(dx: borderWidth, dy: borderWidth), rect)
    }
}
