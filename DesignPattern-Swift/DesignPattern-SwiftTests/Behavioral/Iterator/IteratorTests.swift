import XCTest
@testable import DesignPattern_Swift

class IteratorTests: XCTestCase {
    func testListIterator() {
        let employees = (0..<3).map { Employee(id: UUID(), name: $0.description) }
        let list = List<Employee>(wrappedList: employees)
        let iterator = ListIterator(list: list)
        iterator.printEmployees()
        employees.forEach { XCTAssertTrue($0.printed) }
    }

    func testAbstractIterator() {
        let employees = (0..<3).map { Employee(id: UUID(), name: $0.description) }
        let list = List<Employee>(wrappedList: employees)
        let iterator = list.createIterator()
        iterator.printEmployees()
        employees.forEach { XCTAssertTrue($0.printed) }
    }

    func testInternalIterator() {
        let employees = (0..<3).map { Employee(id: UUID(), name: $0.description) }
        let list = List<Employee>(wrappedList: employees)
        let traverse = PrintNEmployees(list: list, total: 2)
        let traversedAll = traverse.traverse()
        XCTAssertEqual(traverse.total, 2)
        XCTAssertEqual(traverse.count, 2)
        XCTAssertFalse(traversedAll)
    }
}

private class Employee {
    let id: UUID
    let name: String
    private(set) var printed = false

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }

    func print() {
        printed = true
    }
}

private extension Iterator where Item == Employee {
    func printEmployees() {
        first()
        while !isDone {
            currentItem.print()
            next()
        }
    }
}

private class PrintNEmployees: ListTraverser<Employee> {
    private(set) var total = 0
    private(set) var count = 0

    init(list: List<Employee>, total: Int) {
        self.total = total
        super.init(list: list)
    }

    override func processItem(_ item: Employee) -> Bool {
        count += 1
        item.print()
        return count < total
    }
}
