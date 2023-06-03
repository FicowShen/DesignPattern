import Foundation

class IStream {
    var didRead = false
}
class BytecodeStream {
    var data: Any?
}

class Scanner {
    let istream: IStream
    init(istream: IStream) {
        self.istream = istream
    }
}

class Parser {
    func parse(scanner: Scanner, builder: ProgramNodeBuilder) {
        scanner.istream.didRead = true
    }
}

class ProgramNode {
    func traverse(generator: CodeGenerator) {
        generator.output.data = 1
    }
}

class ProgramNodeBuilder {
    func getRootNode() -> ProgramNode {
        return ProgramNode()
    }
}

class CodeGenerator {
    
    let output: BytecodeStream
    
    init(output: BytecodeStream) {
        self.output = output
    }
}

class RISCCodeGenerator: CodeGenerator {}

class Compiler {
    func compile(istream: inout IStream, output: inout BytecodeStream) {
        let scanner = Scanner(istream: istream)
        let builder = ProgramNodeBuilder()
        let parser = Parser()
        
        parser.parse(scanner: scanner, builder: builder)
        
        let generator = RISCCodeGenerator(output: output)
        let parseTree = builder.getRootNode()
        parseTree.traverse(generator: generator)
    }
}
