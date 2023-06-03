import Foundation

protocol Observer: class {
    func update(changedSubject: Subject)
}

class Subject {
    private var observers = [Observer]()

    func attach(observer: Observer) {
        guard !observers.contains(where: { $0 === observer })
            else { return }
        observers.append(observer)
    }

    func detach(observer: Observer) {
        guard let index = observers.firstIndex(where: { $0 === observer })
            else { return }
        observers.remove(at: index)
    }

    func notify() {
        for observer in  observers {
            observer.update(changedSubject: self)
        }
    }
}

class ClockTimer: Subject {
    private(set) var hour: Int = 0, minute: Int = 0, second: Int = 0

    private func increase(arg: inout Int, base: Int) -> Bool {
        arg += 1
        let carry = arg / base
        guard carry > 0 else { return false }
        arg %= base
        return true
    }

    func tick() {
        defer { notify() }
        guard increase(arg: &second, base: 60),
            increase(arg: &minute, base: 60),
            increase(arg: &hour, base: 24)
            else { return }
    }
}

class DigitalClock: Observer {

    private(set) var hour: Int = 0, minute: Int = 0, second: Int = 0
    private let subject: ClockTimer

    init(subject: ClockTimer) {
        self.subject = subject
        subject.attach(observer: self)
    }

    deinit {
        subject.detach(observer: self)
    }

    func update(changedSubject: Subject) {
        guard changedSubject === subject else { return }
        draw()
    }

    func draw() {
        hour = subject.hour
        minute = subject.minute
        second = subject.second
    }
}
