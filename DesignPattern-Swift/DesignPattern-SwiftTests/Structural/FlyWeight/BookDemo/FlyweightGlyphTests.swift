import XCTest

class FlyweightGlyphTests: XCTestCase {
    func testFlyweightGlyph() {
        let glyphFactory = FlyweightGlyphFactory()
        let character = Character("a")
        let char1 = glyphFactory.createCharacter(character)
        let char2 = glyphFactory.createCharacter(character)
        XCTAssertTrue(char1 === char2)
    }
}
