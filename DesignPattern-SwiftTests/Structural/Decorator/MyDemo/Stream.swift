import Foundation

protocol Stream {
    func append(_ content: Any)
    func handleBufferFull()
}

final class MemoryStream: Stream {
    private(set) var buffer = [Any]()
    func append(_ content: Any) {
        buffer.append(content)
    }
    func handleBufferFull() {
        send()
    }
    func send() {
        
    }
}

final class FileStream: Stream {
    private(set) var buffer = [Any]()
    let fileName: String
    init(fileName: String) {
        self.fileName = fileName
    }
    func append(_ content: Any) {
        buffer.append(content)
    }
    func handleBufferFull() {
        writeToFile()
    }
    func writeToFile() {
        
    }
}

class StreamDecorator: Stream {
    
    let component: Stream
    
    init(component: Stream) {
        self.component = component
    }
    func append(_ content: Any) {
        component.append(content)
    }
    func handleBufferFull() {
        component.handleBufferFull()
    }
}

class ASCII7Stream: StreamDecorator {
    override func append(_ content: Any) {
        super.append(simplifiedContent(content))
    }
    private func simplifiedContent(_ content: Any) -> Any {
        return content
    }
}
