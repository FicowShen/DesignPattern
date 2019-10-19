import Foundation

protocol MazeBuilder {
    func buildMaze()
    func buildRoom(roomNumber: Int)
    func buildDoor(roomNumber: Int, anotherRoomNumber: Int)
    
    @discardableResult
    func getMaze() -> Maze?
}

extension MazeBuilder {
    func buildMaze() {}
    func buildRoom(roomNumber: Int) {}
    func buildDoor(roomNumber: Int, anotherRoomNumber: Int) {}
    
    func getMaze() -> Maze? { return nil }
}
