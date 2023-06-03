import XCTest
@testable import DesignPattern_Swift

class EquipmentTests: XCTestCase {

    func testEquipments() {
        let disk1 = FloppyDisk(power: 100, netPrice: 1000)
        let disk2 = FloppyDisk(power: 200, netPrice: 2000)
        let composite = CompositeEquipment()
        composite.addEquipment(disk1)
        composite.addEquipment(disk2)
        XCTAssertEqual(composite.power, 0)
        XCTAssertEqual(composite.netPrice, disk1.netPrice + disk2.netPrice)
        composite.removeEquipment(disk2)
        XCTAssertEqual(composite.netPrice, disk1.netPrice)
    }

}
