import XCTest

final class VisitorTests: XCTestCase {
    func testExample() {
        let disk = Visitor.FloppyDisk(name: "fd", tagPrice: 13, netPrice: 10)
        let gearbox = Visitor.Equipment(name: "gearbox", tagPrice: 35)
        let clutch = Visitor.Equipment(name: "clutch", tagPrice: 25)
        let parts = List<Visitor.Equipment>(wrappedList: [gearbox, clutch])
        let chassis = Visitor.Chassis(name: "chassis",
                                      tagPrice: 100,
                                      parts: parts,
                                      discountPrice: 90)
        let equipments: [Visitor.Equipment] = [disk, chassis]
        let visitor = Visitor.PricingVisitor()
        equipments.forEach { $0.accept(visitor: visitor) }
        let expectedTotalPrice = [disk.netPrice,
                                  gearbox.tagPrice,
                                  clutch.tagPrice,
                                  chassis.discountPrice].reduce(0, { $0 + $1 })
        XCTAssertEqual(visitor.totalPrice, expectedTotalPrice)
    }
}
