import Foundation

class ConstraintSolver {

    struct Constraint: Hashable {
        static func == (lhs: ConstraintSolver.Constraint, rhs: ConstraintSolver.Constraint) -> Bool {
            return lhs.start === rhs.start && lhs.end === rhs.end
        }

        let start: MementoPattern.Graphic
        let end: MementoPattern.Graphic

        func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(start))
            hasher.combine(ObjectIdentifier(end))
        }
    }

    static let shared = ConstraintSolver()

    private(set) var memento: ConstraintSolverMemento? {
        didSet {
            guard memento !== oldValue,
                let memento = memento
                else { return }
            constraints = memento.constraints
        }
    }
    private(set) var constraints = Set<Constraint>()

    private init() {}

    func solve() {}

    func addConstraint(_ constraint: Constraint) {
        constraints.insert(constraint)
    }

    func removeConstraint(_ constraint: Constraint) {
        constraints.remove(constraint)
    }

    func createMemento() -> ConstraintSolverMemento {
        return ConstraintSolverMemento(constraints: constraints)
    }

    func setMemento(_ memento: ConstraintSolverMemento) {
        self.memento = memento
    }
}

class ConstraintSolverMemento {
    fileprivate let constraints: Set<ConstraintSolver.Constraint>
    fileprivate init(constraints: Set<ConstraintSolver.Constraint>) {
        self.constraints = constraints
    }
}
