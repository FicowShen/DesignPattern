import Foundation

struct Component {
    let paragraphCount: Int
}

class Composition {
    private var components = [Component]()
    private var lineCount = 0

    private(set) var breakCount = 0
    private let compositor: Compositor

    init(compositor: Compositor) {
        self.compositor = compositor
    }

    func setup(components: [Component], lineCount: Int) {
        self.components = components
        self.lineCount = lineCount
    }

    func repair() {
        breakCount = compositor.compose(components: components,
                                        lineCount: lineCount)
    }
}

protocol Compositor: class {
    func compose(components: [Component], lineCount: Int) -> Int
}

class SimpleCompositor: Compositor {
    func compose(components: [Component], lineCount: Int) -> Int {
        return lineCount
    }
}

class TexCompositor: Compositor {
    func compose(components: [Component], lineCount: Int) -> Int {
        return components.reduce(0, { $0 + $1.paragraphCount })
    }
}

class ArrayCompositor: Compositor {
    func compose(components: [Component], lineCount: Int) -> Int {
        return components.count
    }
}
