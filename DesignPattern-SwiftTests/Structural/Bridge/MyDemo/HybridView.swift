import UIKit

protocol HybridView {
    var imp: HybridViewImp { get }
    func drawRect(_ rect: CGRect, cornerRadius: CGFloat)
}

extension HybridView {
    var imp: HybridViewImp {
        return HybridViewFactory().makeHybridViewImp()
    }
}

class SquaredButton: HybridView {
    func drawRect(_ rect: CGRect, cornerRadius: CGFloat) {
        let origin = rect.origin
        let size = rect.size
        imp.drawRect(x: origin.x, y: origin.y, width: size.width, height: size.height)
    }
}

class RoundedImageView: HybridView {
    func drawRect(_ rect: CGRect, cornerRadius: CGFloat) {
        imp.drawOval(roundedRect: rect, cornerRadius: cornerRadius)
    }
}
