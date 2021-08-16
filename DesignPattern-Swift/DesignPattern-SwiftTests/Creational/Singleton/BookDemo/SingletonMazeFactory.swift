import Foundation

final class SingletonMazeFactory: MazeFactory, Equatable {
    static func == (lhs: SingletonMazeFactory, rhs: SingletonMazeFactory) -> Bool {
        return lhs === rhs
    }
    
    static let shared = SingletonMazeFactory()
}
