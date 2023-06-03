import XCTest
@testable import DesignPattern_Swift

class StrategyTests: XCTestCase {
    private func checkComposition(compositor: Compositor,
                                  components: [Component],
                                  lineCount: Int,
                                  expectedBreakCount: Int) {
        let composition = Composition(compositor: compositor)
        composition.setup(components: components,
                          lineCount: lineCount)
        composition.repair()
        XCTAssertEqual(composition.breakCount, expectedBreakCount, "\(type(of: compositor)) test failed")
    }

    func testExample() {
        let components = (1...5).map { Component(paragraphCount: $0) }
        let lineCount = 3

        checkComposition(compositor: SimpleCompositor(),
                         components: components,
                         lineCount: lineCount,
                         expectedBreakCount: lineCount)

        let paragraphCount = (1...5).reduce(0, { $0 + $1 })
        checkComposition(compositor: TexCompositor(),
                         components: components,
                         lineCount: lineCount,
                         expectedBreakCount: paragraphCount)

        checkComposition(compositor: ArrayCompositor(),
                         components: components,
                         lineCount: lineCount,
                         expectedBreakCount: components.count)
    }
}
