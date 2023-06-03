import UIKit

protocol Graphic {
    func drawInRect(_ rect: CGRect)
}

class Image: Graphic {
    
    let fileName: String
    
    private(set) var rect: CGRect?
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func drawInRect(_ rect: CGRect) {
        self.rect = rect
    }
}

class ImageProxy: Graphic {
    
    let fileName: String
    
    private(set) var image: Image? // enabled public getting for testing
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func drawInRect(_ rect: CGRect) {
        getImage().drawInRect(rect)
    }
    
    private func getImage() -> Image {
        if let image = self.image {
            return image
        }
        let image = Image(fileName: fileName)
        self.image = image
        return image
    }
}
