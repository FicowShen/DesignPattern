import Foundation

enum Topic {
    case noHelp
    case help(name: String)
}

class HelpHandler {
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

class ChainWidget: HelpHandler {
    private let parent: ChainWidget?
    var customizedHelp: (() -> Void)?

    init(parent: ChainWidget?, topic: Topic) {
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

class ChainButton: ChainWidget {}

class ChainDialog: ChainWidget {
    init(handler: HelpHandler?, topic: Topic) {
        super.init(parent: nil, topic: .noHelp)
        setHandler(handler, topic: topic)
    }
}

class ChainApplication: HelpHandler {
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
