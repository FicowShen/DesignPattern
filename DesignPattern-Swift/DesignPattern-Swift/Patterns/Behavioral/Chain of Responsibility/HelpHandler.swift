import Foundation

class HelpHandler {

    enum Topic {
        case noHelp
        case help(name: String)
    }

    class Widget: HelpHandler {

        class Button: Widget {}

        class Dialog: Widget {
            init(handler: HelpHandler?, topic: Topic) {
                super.init(parent: nil, topic: .noHelp)
                setHandler(handler, topic: topic)
            }
        }

        private let parent: Widget?
        var customizedHelp: (() -> Void)?

        init(parent: Widget?, topic: Topic) {
            self.parent = parent
            super.init(handler: parent, topic: topic)
        }

        override func handleHelp() {
            if hasHelp {
                customizedHelp?()
            } else {
                super.handleHelp()
            }
        }
    }

    class Application: HelpHandler {
        var customizedHelp: (() -> Void)?

        init(topic: Topic) {
            super.init(handler: nil, topic: topic)
        }

        override func handleHelp() {
            if hasHelp {
                customizedHelp?()
            } else {
                super.handleHelp()
            }
        }
    }
    

    private var topic: Topic

    private var successor: HelpHandler?

    var hasHelp: Bool {
        if case .noHelp = topic {
            return false
        }
        return true
    }

    init(handler: HelpHandler?, topic: Topic) {
        self.successor = handler
        self.topic = topic
    }

    func setHandler(_ handler: HelpHandler?, topic: Topic) {
        self.successor = handler
        self.topic = topic
    }

    func handleHelp() {
        successor?.handleHelp()
    }
}
