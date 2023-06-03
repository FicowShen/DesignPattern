import XCTest
@testable import DesignPattern_Swift

class DomainTests: XCTestCase {

    func testDomain() {
        let process = Process()
        let memory = Memory()
        let address = Address()
        process.domain.addMemory(memory, address: address)
        process.domain.removeMemory(memory)
        XCTAssertTrue(process.domain.cache.memoryObjects.isEmpty)
    }

}
