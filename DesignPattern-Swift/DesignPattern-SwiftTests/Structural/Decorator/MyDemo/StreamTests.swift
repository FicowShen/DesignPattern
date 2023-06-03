import XCTest
@testable import DesignPattern_Swift

class StreamTests: XCTestCase {

    func testStream() {
        let fileStream = FileStream(fileName: "file")
        let stream = ASCII7Stream(component: fileStream)
        let content: Any = "content"
        stream.append(content)
        XCTAssert(fileStream.buffer.first as? String == content as? String)
    }

}
