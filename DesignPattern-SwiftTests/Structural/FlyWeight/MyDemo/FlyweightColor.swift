import UIKit

final class FlyweightColor {
    let red: Int
    let green: Int
    let blue: Int
    
    init(red: Int, green: Int, blue: Int) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

struct FlyweightColorDot {
    let frame: CGRect
    let color: FlyweightColor
    
    func drawDot() {}
}

class FlyweightColorFactory {
    
    enum ColorName {
        case red, green, blue
    }
    
    private var colors = [ColorName: FlyweightColor]()
    
    func createColor(name: ColorName) -> FlyweightColor {
        if let color = colors[name] {
            return color
        }
        let color: FlyweightColor
        switch name {
        case .red:
            color = FlyweightColor(red: 255, green: 0, blue: 0)
        case .green:
            color = FlyweightColor(red: 0, green: 255, blue: 0)
        case .blue:
            color = FlyweightColor(red: 0, green: 0, blue: 255)
        }
        colors[name] = color
        return color
    }
}
