import XCTest
@testable import DesignPattern_Swift

class ObserverTests: XCTestCase {
    func testExample() {
        let timer = ClockTimer()
        let clock = DigitalClock(subject: timer)

        (0..<3660).forEach { _ in timer.tick() }

        XCTAssertEqual(timer.hour, 1)
        XCTAssertEqual(timer.minute, 1)
        XCTAssertEqual(timer.second, 0)

        XCTAssertEqual(timer.hour, clock.hour)
        XCTAssertEqual(timer.minute, clock.minute)
        XCTAssertEqual(timer.second, clock.second)
    }
}
