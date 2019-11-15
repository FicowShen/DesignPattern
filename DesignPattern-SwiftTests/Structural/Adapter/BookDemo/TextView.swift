import Foundation

class TextView {
    
    var shouldBeEmpty: Bool
    private let left, bottom, width, height: Double
    
    init(left: Double, bottom: Double, width: Double, height: Double, shouldBeEmpty: Bool) {
        self.left = left
        self.bottom = bottom
        self.width = width
        self.height = height
        self.shouldBeEmpty = shouldBeEmpty
    }
    
    func getOrigin() -> (Double, Double) {
        return (bottom, left)
    }
    
    func getExtent() -> (Double, Double) {
        return (width, height)
    }
    
    func isEmpty() -> Bool {
        return shouldBeEmpty
    }
}
