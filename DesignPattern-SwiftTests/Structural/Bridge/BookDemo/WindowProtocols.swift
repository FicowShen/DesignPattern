import Foundation

protocol Window {
    func drawContents()
    
    func getWindowImp() -> WindowImp
    func getView() -> View
}

extension Window {
    func getWindowImp() -> WindowImp {
        return WindowSystemFactory().makeWindowImp()
    }
}

protocol WindowImp {
    func impTop()
    func impBottom()
    
    func deviceRect(x0: Double, y0: Double, x1: Double, y1: Double)
    func deviceBitmap(_ name: String, x: Double, y: Double)
}

class View {
    func drawOn(_ window: Window) {
        
    }
}
