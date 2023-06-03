import UIKit

protocol DialogDirector: class {
    func showDialog()
    func widgetChanged(_ widget: Mediator.Widget)
}

enum Mediator {
    enum MouseEvent {
        case click
        case move
    }

    class Widget {
        private let director: DialogDirector

        init(director: DialogDirector) {
            self.director = director
        }

        func changed() {
            director.widgetChanged(self)
        }

        func handleMouse(_ event: MouseEvent) {

        }
    }

    class ListBox: Widget {
        private(set) var list: [String] = []

        func setList(_ list: [String]) {
            self.list = list
        }
    }

    class EntryField: Widget {
        private(set) var text = ""

        func setText(_ text: String) {
            self.text = text
        }
    }

    class Button: Widget {
        override func handleMouse(_ event: MouseEvent) {
            changed()
        }
    }
}

class FontDialogDirector: DialogDirector {

    private lazy var okButton = Mediator.Button(director: self)
    private lazy var cancelButton = Mediator.Button(director: self)
    private lazy var fontList = Mediator.ListBox(director: self)
    private lazy var fontName = Mediator.EntryField(director: self)

    private(set) var displayingWidgets = [Mediator.Widget]()
    private(set) var shouldDismissDialog = false

    func showDialog() {
        displayingWidgets = [okButton, cancelButton, fontList, fontName]
    }

    private func dismissDialog() {
        shouldDismissDialog = true
    }

    func widgetChanged(_ widget: Mediator.Widget) {
        if widget === okButton {

        } else if widget === cancelButton {
            dismissDialog()
        } else if widget === fontList {

        } else if widget === fontName {

        }
    }
}
