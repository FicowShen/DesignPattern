import Foundation

struct Point: Equatable {
    let x, y: Double
}

protocol Shape: class {
    func boundingBox() -> (bottomLeft: Point, topRight: Point)
    func createManipulator() -> Manipulator
}

class Manipulator {
    
    let shape: Shape
    
    init(shape: Shape) {
        self.shape = shape
    }
}

class TextManipulator: Manipulator {}

