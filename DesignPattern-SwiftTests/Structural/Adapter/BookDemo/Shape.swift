import Foundation
import struct UIKit.CGPoint

typealias Point = CGPoint

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

