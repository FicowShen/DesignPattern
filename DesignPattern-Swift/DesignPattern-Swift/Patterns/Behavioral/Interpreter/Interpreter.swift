import Foundation

protocol BooleanExp: CustomStringConvertible {
    func evaluate(context: Interpreter.Context) -> Bool
    func replace(name: String, exp: BooleanExp) -> BooleanExp
    func copy() -> BooleanExp
}

enum Interpreter {
    final class Context {
        private(set) var dict = [String: Bool]()

        func lookup(name: String) -> Bool {
            return dict[name] ?? false
        }

        func assign(exp: BooleanExp, value: Bool) {
            guard let exp = exp as? VariableExp else { return }
            dict[exp.name] = value
        }
    }

    final class Constant: BooleanExp {

        let value: Bool
        var description: String { value.description }

        init(_ value: Bool) {
            self.value = value
        }

        func evaluate(context: Interpreter.Context) -> Bool { value }
        func replace(name: String, exp: BooleanExp) -> BooleanExp { self }
        func copy() -> BooleanExp { self }
    }

    final class VariableExp: BooleanExp {
        let name: String
        var description: String { name }

        init(name: String) {
            self.name = name
        }

        func evaluate(context: Interpreter.Context) -> Bool {
            return context.lookup(name: name)
        }

        func replace(name: String, exp: BooleanExp) -> BooleanExp {
            if name == self.name {
                return exp.copy()
            }
            return VariableExp(name: self.name)
        }

        func copy() -> BooleanExp {
            return VariableExp(name: name)
        }
    }

    final class AndExp: BooleanExp {
        let lhs: BooleanExp, rhs: BooleanExp
        var description: String {
            "(\(lhs.description) and \(rhs.description))"
        }

        init(lhs: BooleanExp, rhs: BooleanExp) {
            self.lhs = lhs
            self.rhs = rhs
        }

        func evaluate(context: Interpreter.Context) -> Bool {
            return lhs.evaluate(context: context) && rhs.evaluate(context: context)
        }

        func replace(name: String, exp: BooleanExp) -> BooleanExp {
            return AndExp(lhs: lhs.replace(name: name, exp: exp), rhs: rhs.replace(name: name, exp: exp))
        }

        func copy() -> BooleanExp {
            return AndExp(lhs: lhs.copy(), rhs: rhs.copy())
        }
    }

    final class OrExp: BooleanExp {
        let lhs: BooleanExp, rhs: BooleanExp
        var description: String {
            "(\(lhs.description) or \(rhs.description))"
        }

        init(lhs: BooleanExp, rhs: BooleanExp) {
            self.lhs = lhs
            self.rhs = rhs
        }

        func evaluate(context: Interpreter.Context) -> Bool {
            return lhs.evaluate(context: context) || rhs.evaluate(context: context)
        }

        func replace(name: String, exp: BooleanExp) -> BooleanExp {
            return OrExp(lhs: lhs.replace(name: name, exp: exp), rhs: rhs.replace(name: name, exp: exp))
        }

        func copy() -> BooleanExp {
            return OrExp(lhs: lhs.copy(), rhs: rhs.copy())
        }
    }

    final class NotExp: BooleanExp {
        let wrappedExp: BooleanExp
        var description: String {
            "(not \(wrappedExp.description))"
        }

        init(exp: BooleanExp) {
            self.wrappedExp = exp
        }

        func evaluate(context: Interpreter.Context) -> Bool {
            return !(wrappedExp.evaluate(context: context))
        }

        func replace(name: String, exp: BooleanExp) -> BooleanExp {
            return NotExp(exp: wrappedExp.replace(name: name, exp: exp))
        }

        func copy() -> BooleanExp {
            return NotExp(exp: wrappedExp.copy())
        }
    }

}
