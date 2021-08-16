import XCTest

class CompilerTests: XCTestCase {

    func testCompiler() {
        let compiler = Compiler()
        var istream = IStream()
        var output = BytecodeStream()
        compiler.compile(istream: &istream, output: &output)
        XCTAssertTrue(istream.didRead)
        XCTAssertNotNil(output.data)
    }

}
