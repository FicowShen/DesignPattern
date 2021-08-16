import Foundation

protocol FirstResponderConvertible {
    var canBeomeFirstResponder: Bool { get }
    var isFirstResponder: Bool { get }
    func becomeFirstResponder()
    func resignFirstResponder()
}
