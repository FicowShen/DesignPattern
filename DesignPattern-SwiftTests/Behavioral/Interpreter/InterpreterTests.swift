import XCTest

class InterpreterTests: XCTestCase {
    func testExample() {
        let x = Interpreter.VariableExp(name: "X")
        let y = Interpreter.VariableExp(name: "Y")
        let andExp1 = Interpreter.AndExp(lhs: Interpreter.Constant(true),
                                         rhs: x)
        let andExp2 = Interpreter.AndExp(lhs: y,
                                         rhs: Interpreter.NotExp(exp: x))
        let orExp = Interpreter.OrExp(lhs: andExp1,
                                      rhs: andExp2)

        let context = Interpreter.Context()
        context.assign(exp: x, value: false)
        context.assign(exp: y, value: true)

//        print(orExp)
        var result = orExp.evaluate(context: context)
        XCTAssertTrue(result)

        let z = Interpreter.VariableExp(name: "Z")
        let notZ = Interpreter.NotExp(exp: z)

        let yReplaced = orExp.replace(name: "Y", exp: notZ)
        context.assign(exp: z, value: true)

//        print(yReplaced)
        result = yReplaced.evaluate(context: context)
        XCTAssertFalse(result)
    }
}
