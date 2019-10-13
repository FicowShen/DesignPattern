import Foundation

class BookCover {}

class BookPage {
    let index: Int
    init(index: Int) {
        self.index = index
    }
}

class Book {
    var cover: BookCover?
    var pages = [BookPage]()
}

protocol BookMaker {
    static func createBook() -> Book?
    
    static func makeBook() -> Book
    static func makeCover() -> BookCover
    static func makePage(index: Int) -> BookPage
}

extension BookMaker {
    static func makeBook() -> Book { return Book() }
    static func makeCover() -> BookCover { return BookCover() }
    static func makePage(index: Int) -> BookPage { return BookPage(index: index) }
    
    static func createBook() -> Book? {
        let book = makeBook()
        
        book.cover = makeCover()
        book.pages = (0..<5).map { makePage(index: $0) }
        
        return book
    }
}
