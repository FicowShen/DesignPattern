import XCTest
@testable import DesignPattern_Swift

class TreeNodeTests: XCTestCase {

    func testTreeNode() {
        let root = BranchNode(id: 0)
        
        let branch1 = BranchNode(id: 1)
        let branch2 = BranchNode(id: 2)
        root.addSubNode(branch1)
        root.addSubNode(branch2)
        
        let branch11 = BranchNode(id: 11)
        let branch12 = BranchNode(id: 12)
        let branch13 = BranchNode(id: 13)
        let branch14 = BranchNode(id: 14)
        
        [branch11,
         branch12,
         branch13,
         branch14].forEach { branch1.addSubNode($0) }
        
        let branch21 = BranchNode(id: 21)
        let branch22 = BranchNode(id: 22)
        
        [branch21,
         branch22].forEach { branch2.addSubNode($0) }
        
        let leaf111 = LeafNode(id: 111, leafColor: "Green")
        let leaf112 = LeafNode(id: 112, leafColor: "Green")
        let leaf113 = LeafNode(id: 113, leafColor: "Yellow")
        [leaf111, leaf112, leaf113].forEach { branch11.addSubNode($0) }
        
        let fruit121 = FruitNode(id: 121, name: "Apple1")
        let fruit122 = FruitNode(id: 122, name: "Apple2")
        [fruit121, fruit122].forEach { branch12.addSubNode($0) }
        
        XCTAssertTrue(fruit122.superNode is BranchNode)
        XCTAssertTrue(leaf111.superNode is BranchNode)
        
        var results = [String]()
        var nodes: [TreeNode] = [root]
        while !nodes.isEmpty {
            let node = nodes.removeFirst()
            switch node {
            case let branch as BranchNode:
                results.append("branch \(branch.id)")
            case let leaf as LeafNode:
                results.append("leaf \(leaf.id), color: \(leaf.leafColor)")
            case let fruit as FruitNode:
                results.append("fruit \(fruit.id), name: \(fruit.name)")
            default:
                XCTFail()
            }
            nodes.append(contentsOf: node.subNodes)
        }
        
        let expectedResults = [
            "branch 0",
            "branch 1",
            "branch 2",
            "branch 11",
            "branch 12",
            "branch 13",
            "branch 14",
            "branch 21",
            "branch 22",
            "leaf 111, color: Green",
            "leaf 112, color: Green",
            "leaf 113, color: Yellow",
            "fruit 121, name: Apple1",
            "fruit 122, name: Apple2"
        ]
        XCTAssertEqual(results, expectedResults)
    }

}
