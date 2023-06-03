import Foundation

protocol TreeNode: class {
    var id: Int { get }
    var superNode: TreeNode? { get set }
    var subNodes: [TreeNode] { get }
    
    func addSubNode(_ node: TreeNode)
    func removeSubNode(_ node: TreeNode)
}

extension TreeNode {
    func addSubNode(_ node: TreeNode) {}
    func removeSubNode(_ node: TreeNode) {}
}

class BranchNode: TreeNode {
    
    var superNode: TreeNode?
    private(set) var subNodes = [TreeNode]()
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func addSubNode(_ node: TreeNode) {
        subNodes.append(node)
        node.superNode = self
    }
    
    func removeSubNode(_ node: TreeNode) {
        guard let index = subNodes.firstIndex(where: { $0 === node })
            else { return }
        subNodes.remove(at: index)
        node.superNode = nil
    }
}

class FruitNode: TreeNode {
    
    var superNode: TreeNode?
    var subNodes: [TreeNode] = []
    
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

class LeafNode: TreeNode {
    
    var superNode: TreeNode?
    var subNodes: [TreeNode] = []
    
    let id: Int
    let leafColor: String
    
    init(id: Int, leafColor: String) {
        self.id = id
        self.leafColor = leafColor
    }
}
