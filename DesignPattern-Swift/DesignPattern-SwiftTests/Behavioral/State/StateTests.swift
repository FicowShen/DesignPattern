import XCTest
@testable import DesignPattern_Swift

class StateTests: XCTestCase {
    func testExample() {
        let connection = TCPConnection()
        XCTAssertTrue(connection.state === TCPClosed.shared)
        connection.passiveOpen()
        XCTAssertTrue(connection.state === TCPListen.shared)
        connection.send()
        XCTAssertTrue(connection.state === TCPEstablished.shared)
        let stream = TCPOctetStream()
        TCPEstablished.shared.transimit(connection: connection,
                                        stream: stream)
        XCTAssertTrue(connection.processedStream === stream)
        connection.close()
        XCTAssertTrue(connection.state === TCPListen.shared)

    }
}
