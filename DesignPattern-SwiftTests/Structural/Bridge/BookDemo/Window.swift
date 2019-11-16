import Foundation

class ApplicationWindow: Window {
    
    let contents: View
    
    init(contents: View) {
        self.contents = contents
    }
    
    func drawContents() {
        getView().drawOn(self)
    }
    
    func getView() -> View {
        return contents
    }
}

class IconWindow: Window {
    
    let bitmapName: String
    let contents: View
    
    init(bitmapName: String, contents: View) {
        self.bitmapName = bitmapName
        self.contents = contents
    }
    
    func drawContents() {
        getWindowImp().deviceBitmap(bitmapName, x: 0.0, y: 0.0)
    }

    func getView() -> View {
        return contents
    }
}
