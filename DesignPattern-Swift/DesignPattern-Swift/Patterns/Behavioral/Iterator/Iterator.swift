import Foundation

protocol AbstractList {
    associatedtype Item
    func createIterator() -> Iterator<Self.Item>
}

class Iterator<Item> {
    var isDone: Bool { fatalError() }
    var currentItem: Item { fatalError() }
    func first() { fatalError() }
    func next() { fatalError() }
}

class List<Item>: AbstractList {
    func createIterator() -> Iterator<Item> {
        return ListIterator(list: self)
    }

    var count: Int { wrappedList.count }
    private let wrappedList: [Item]

    init(wrappedList: [Item]) {
        self.wrappedList = wrappedList
    }

    func getItemAtIndex(_ index: Int) -> Item { wrappedList[index] }
}

class ListIterator<Item>: Iterator<Item> {

    private let list: List<Item>
    private var current: Int

    init(list: List<Item>) {
        self.list = list
        current = 0
        super.init()
    }

    override var isDone: Bool { current >= list.count }

    override var currentItem: Item {
        if isDone {
            fatalError()
        }
        return list.getItemAtIndex(current)
    }

    override func first() {
        current = 0
    }

    override func next() {
        current += 1
    }
}

class ListTraverser<Item> {

    private let iterator: ListIterator<Item>

    init(list: List<Item>) {
        self.iterator = ListIterator<Item>(list: list)
    }

    func traverse() -> Bool {
        var result = false

        iterator.first()
        while !iterator.isDone {
            result = processItem(iterator.currentItem)
            if !result {
                break
            }
            iterator.next()
        }
        return result
    }

    func processItem(_ item: Item) -> Bool {
        fatalError()
    }
}
