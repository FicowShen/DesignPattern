import UIKit

protocol VisualComponent {
    func draw(inRect rect: CGRect)
    func resize()
}

class Decorator: VisualComponent {
    var component: VisualComponent
    init(component: VisualComponent) {
        self.component = component
    }
    
    func draw(inRect rect: CGRect) {
        component.draw(inRect: rect)
    }
    func resize() {
        component.resize()
    }
}

class TextViewComponent: VisualComponent {
    
    var rect: CGRect?
    
    func draw(inRect rect: CGRect) {
        self.rect = rect
    }
    func resize() {}
}

class BorderDecorator: Decorator {
    var borderWidth: CGFloat
    
    init(component: VisualComponent, borderWidth: CGFloat) {
        self.borderWidth = borderWidth
        super.init(component: component)
    }
    
    override func draw(inRect rect: CGRect) {
        super.draw(inRect: rect.insetBy(dx: borderWidth, dy: borderWidth))
        drawBorder(borderWidth: borderWidth)
    }
    func drawBorder(borderWidth: CGFloat) {}
}

class ScrollDecorator: Decorator {
    func scrollTo(scrollPosition: CGPoint) {}
}

class VisualWindow {
    
    private(set) var contents = [VisualComponent]()
    
    func setContent(content: VisualComponent) {
        contents.append(content)
    }
}
