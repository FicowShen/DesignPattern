import XCTest

class GraphicTests: XCTestCase {
    func testExample() {
        let fileName = "TestImage"
        let proxy = ImageProxy(fileName: fileName)
        XCTAssertNil(proxy.image)
        proxy.drawInRect(.zero)
        XCTAssertEqual(proxy.image?.fileName, fileName)
    }
}
