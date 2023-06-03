import Foundation

protocol Command: class {
    func execute()
}

enum CommandPattern {

    class Application {
        private(set) var doc: Document?

        func addDocument(_ doc: Document) {
            self.doc = doc
        }
    }

    class Document {
        let name: String

        init(name: String) {
            self.name = name
        }

        func open() {

        }
    }
}

final class OpenCommand: Command {

    private let application: CommandPattern.Application
    var response: String?

    init(application: CommandPattern.Application) {
        self.application = application
    }

    func execute() {
        guard let name = askUser() else { return }
        let doc = CommandPattern.Document(name: name)
        application.addDocument(doc)
        doc.open()
    }

    func askUser() -> String? {
        return response
    }
}

protocol CommandReceiver: class {
    func action()
}

final class SimpleCommand<Receiver: CommandReceiver>: Command {

    let receiver: Receiver
    let action: (() -> Void)

    // book demo used C++ "Pointers to member functions"
    // typedef void (Receiver::* Action) ();
    // https://en.cppreference.com/w/cpp/language/pointer#Pointers_to_members
    init(receiver: Receiver) {
        self.receiver = receiver
        self.action = receiver.action
    }

    func execute() {
        receiver.action()
    }
}

final class MacroCommand: Command {

    private(set) var commands = [Command]()

    func execute() {
        commands.forEach { $0.execute() }
    }

    func addCommand(_ c: Command) {
        commands.append(c)
    }

    func removeCommand(_ c: Command) {
        guard let index = commands.firstIndex(where: { $0 === c })
            else { return }
        commands.remove(at: index)
    }
}
