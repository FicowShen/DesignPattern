import UIKit

protocol HybridViewImp {
    func drawRect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)
    func drawOval(roundedRect rect: CGRect, cornerRadius: CGFloat)
}

class MacViewImp: HybridViewImp {
    func drawRect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        
    }
    
    func drawOval(roundedRect rect: CGRect, cornerRadius: CGFloat) {
        
    }
}

class LinuxViewImp: HybridViewImp {
    func drawRect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        
    }
    
    func drawOval(roundedRect rect: CGRect, cornerRadius: CGFloat) {
        
    }
}
