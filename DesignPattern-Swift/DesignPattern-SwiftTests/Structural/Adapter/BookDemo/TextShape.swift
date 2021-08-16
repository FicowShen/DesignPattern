import Foundation

class TextShapeWithClass: TextView, Shape {
    
    func boundingBox() -> (bottomLeft: Point, topRight: Point) {
        let (left, bottom) = getOrigin()
        let (width, height) = getExtent()
        
        let bottomLeft = Point(x: left, y: bottom)
        let topRight = Point(x: left + width, y: bottom + height)
        
        return (bottomLeft, topRight)
    }
    
    func createManipulator() -> Manipulator {
        return TextManipulator(shape: self)
    }
}

class TextShapeWithInstance: Shape {
    
    let textView: TextView
    
    init(textView: TextView) {
        self.textView = textView
    }
    
    func boundingBox() -> (bottomLeft: Point, topRight: Point) {
        let (left, bottom) = textView.getOrigin()
        let (width, height) = textView.getExtent()
        
        let bottomLeft = Point(x: left, y: bottom)
        let topRight = Point(x: left + width, y: bottom + height)
        
        return (bottomLeft, topRight)
    }
    
    func createManipulator() -> Manipulator {
        return TextManipulator(shape: self)
    }
}
