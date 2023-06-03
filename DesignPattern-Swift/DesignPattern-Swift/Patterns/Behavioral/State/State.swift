import Foundation

class TCPOctetStream {}

class TCPConnection {
    func activeOpen() {
        state.activeOpen(connection: self)
    }

    func passiveOpen() {
        state.passiveOpen(connection: self)
    }

    func close() {
        state.close(connection: self)
    }

    func send() {
        state.send(connection: self)
    }

    func acknowledge() {
        state.acknowledge(connection: self)
    }

    func synchronize() {
        state.synchronize(connection: self)
    }

    func processOctet(_ stream: TCPOctetStream) {
        processedStream = stream
    }

    private(set) var processedStream: TCPOctetStream?
    private(set) var state: TCPState = TCPClosed.shared

    fileprivate func changeState(_ state: TCPState) {
        self.state = state
    }
}

class TCPState {
    func transimit(connection: TCPConnection,
                   stream: TCPOctetStream) {}
    func activeOpen(connection: TCPConnection) {}
    func passiveOpen(connection: TCPConnection) {}
    func close(connection: TCPConnection) {}
    func send(connection: TCPConnection) {}
    func acknowledge(connection: TCPConnection) {}
    func synchronize(connection: TCPConnection) {}

    fileprivate func changeState(_ state: TCPState,
                                 connection: TCPConnection) {
        connection.changeState(state)
    }
}

final class TCPEstablished: TCPState {
    static let shared = TCPEstablished()

    override func activeOpen(connection: TCPConnection) {
        changeState(TCPEstablished.shared, connection: connection)
    }

    override func close(connection: TCPConnection) {
        changeState(TCPListen.shared, connection: connection)
    }

    override func transimit(connection: TCPConnection, stream: TCPOctetStream) {
        connection.processOctet(stream)
    }
}

final class TCPListen: TCPState {
    static let shared = TCPListen()

    override func send(connection: TCPConnection) {
        changeState(TCPEstablished.shared, connection: connection)
    }
}

final class TCPClosed: TCPState {
    static let shared = TCPClosed()

    override func passiveOpen(connection: TCPConnection) {
        changeState(TCPListen.shared, connection: connection)
    }
}
