import Foundation
import struct UIKit.CGRect

class Control {
    
    var frame: CGRect
    var isInteractionEnabled: Bool
    var isVisible: Bool
    
    private(set) var isFocused = false
    
    init(frame: CGRect,
         isVisible: Bool,
         isInteractionEnabled: Bool) {
        self.frame = frame
        self.isVisible = isVisible
        self.isInteractionEnabled = isInteractionEnabled
    }
    
    func becomeFocused() {
        isFocused = true
    }
    
    func removeFocus() {
        isFocused = false
    }
}

class Button: Control {}

class RespondableControl: FirstResponderConvertible {
    
    private let control: Control
    
    init(control: Control) {
        self.control = control
    }
    
    var canBeomeFirstResponder: Bool {
        return control.isVisible && control.isInteractionEnabled
    }
    
    var isFirstResponder: Bool {
        return control.isFocused
    }
    
    func becomeFirstResponder() {
        control.becomeFocused()
    }
    
    func resignFirstResponder() {
        control.removeFocus()
    }
}
