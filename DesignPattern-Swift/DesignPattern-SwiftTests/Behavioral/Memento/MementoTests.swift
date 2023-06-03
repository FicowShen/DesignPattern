import XCTest
@testable import DesignPattern_Swift

class MementoTests: XCTestCase {
    func testExample() {
        let graphic1 = MementoPattern.Graphic()
        let graphic2 = MementoPattern.Graphic()
        ConstraintSolver.shared.addConstraint(.init(start: graphic1, end: graphic2))

        let moveCommand = MementoPattern.MoveCommand(target: graphic1,
                                                     delta: 2)
        moveCommand.execute()
        XCTAssertNotNil(moveCommand.state)
        XCTAssertEqual(graphic1.moved, 2)
        let memento = moveCommand.state
        let constraints = ConstraintSolver.shared.constraints

        let graphic3 = MementoPattern.Graphic()
        ConstraintSolver.shared.addConstraint(.init(start: graphic1, end: graphic3))

        moveCommand.unexecute()
        XCTAssertEqual(graphic1.moved, 0)
        XCTAssertTrue(ConstraintSolver.shared.memento === memento)
        XCTAssertEqual(constraints, ConstraintSolver.shared.constraints)
    }
}
