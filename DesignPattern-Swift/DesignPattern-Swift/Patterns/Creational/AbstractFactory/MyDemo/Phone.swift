import Foundation

protocol Screen {
    var content: String { get }
    func displayContent() -> String
}

protocol Phone {
    var screen: Screen { get set }
}
