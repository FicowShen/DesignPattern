import XCTest

class TextShapeTests: XCTestCase {

    func testTextShapeWithClass() {
        let textShape = TextShapeWithClass(left: 0,
                                           bottom: 0,
                                           width: 10,
                                           height: 10,
                                           shouldBeEmpty: true)
        let (bottomLeft, topRight) = textShape.boundingBox()
        XCTAssertEqual(bottomLeft, Point(x: 0, y: 0))
        XCTAssertEqual(topRight, Point(x: 10, y: 10))
        let manipulator = textShape.createManipulator()
        XCTAssertTrue(manipulator.shape === textShape)
    }
    
    func testTextShapeWithInstance() {
        let textView = TextView(left: 0,
                                bottom: 0,
                                width: 10,
                                height: 10,
                                shouldBeEmpty: true)
        let textShape = TextShapeWithInstance(textView: textView)
        let (bottomLeft, topRight) = textShape.boundingBox()
        XCTAssertEqual(bottomLeft, Point(x: 0, y: 0))
        XCTAssertEqual(topRight, Point(x: 10, y: 10))
        let manipulator = textShape.createManipulator()
        XCTAssertTrue(manipulator.shape === textShape)
    }
}

