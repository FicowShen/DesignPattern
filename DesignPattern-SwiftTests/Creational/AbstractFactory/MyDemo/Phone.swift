import Foundation

protocol Screen {
    func displayContent() -> String
}

protocol Phone {
    var screen: Screen { get }
}
