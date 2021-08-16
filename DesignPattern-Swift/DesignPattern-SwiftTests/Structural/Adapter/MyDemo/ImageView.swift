import Foundation
import struct UIKit.CGRect

class ImageView: Control, FirstResponderConvertible {
    
    init(frame: CGRect,
         isVisible: Bool) {
        super.init(frame: frame,
                   isVisible: isVisible,
                   isInteractionEnabled: false)
    }
    var canBeomeFirstResponder: Bool {
        return isVisible && isInteractionEnabled && frame != .zero
    }
    
    var isFirstResponder: Bool {
        return isFocused
    }
    
    func becomeFirstResponder() {
        becomeFocused()
    }
    
    func resignFirstResponder() {
        removeFocus()
    }
}
