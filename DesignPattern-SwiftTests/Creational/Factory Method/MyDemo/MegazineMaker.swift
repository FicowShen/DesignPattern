import Foundation

class HardCover: BookCover {}

class ColorfulBookPage: BookPage {}

class MegazineMaker: BookMaker {
    static func makeCover() -> BookCover { return HardCover() }
    static func makePage(index: Int) -> BookPage { return ColorfulBookPage(index: index) }
}
