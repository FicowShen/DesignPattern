import Foundation

enum MementoPattern {
    class Graphic {
        private(set) var moved: Float = 0

        func move(delta: Float) {
            moved += delta
        }
    }

    class MoveCommand {

        private let target: Graphic, delta: Float
        private(set) var state: ConstraintSolverMemento?
        private var solver: ConstraintSolver { ConstraintSolver.shared }

        init(target: Graphic, delta: Float) {
            self.target = target
            self.delta = delta
        }

        func execute() {
            state = solver.createMemento()
            target.move(delta: delta)
            solver.solve()
        }

        func unexecute() {
            guard let state = state else { return }
            target.move(delta: -delta)
            solver.setMemento(state)
            solver.solve()
        }
    }
}
