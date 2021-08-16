import Foundation

protocol TemplateView: class {
    var didFocus: Bool { get set }
    func display()
    func doDisplay()
}

extension TemplateView {
    func display() {
        setFocus()
        doDisplay()
        resetFocus()
    }

    private func setFocus() { didFocus = true }
    private func resetFocus() {}

    func doDisplay() {}
}

final class MyView: TemplateView {
    var didFocus = false
    private(set) var didDisplay = false

    func doDisplay() {
        didDisplay = true
    }
}
