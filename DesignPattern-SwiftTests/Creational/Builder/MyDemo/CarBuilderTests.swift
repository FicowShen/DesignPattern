import XCTest

class CarBuilderTests: XCTestCase {

    func testExample() {
        let builder = BenzCarBuilder()
        guard let car = Car.createCar(builder: builder) else {
            XCTFail()
            return
        }
        XCTAssertEqual(car.wheels.count, 4)
        XCTAssertEqual(car.seats.count, 4)
        XCTAssertEqual(car.doors.count, 4)
        
        XCTAssertTrue(car.wheels.first is RaceCarWheel)
        XCTAssertTrue(car.seats.first is SoftCarSeat)
        XCTAssertTrue(car.doors.first is BulletProofCarDoor)
        
        XCTAssertTrue(car.engine is ElectricCarEngine)
        XCTAssertTrue(car.gearbox is AutomaticCarGearbox)
    }

}
