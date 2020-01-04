import UIKit

protocol FlyweightGlyph {
    func draw(context: FlyweightGlyphContext)
}

class FlyweightGlyphContext {
    func next(step: Int = 1) {}
    func setFont(_ font: UIFont, span: Int = 1) {}
}

class FlyweightCharacter: FlyweightGlyph {
    func draw(context: FlyweightGlyphContext) {}
}

class FlyweightGlyphFactory {
    
    private var chars = [Character: FlyweightCharacter]()
    
    func createCharacter(_ char: Character) -> FlyweightCharacter {
        if let cachedChar = chars[char] {
            return cachedChar
        }
        let newChar = FlyweightCharacter()
        chars[char] = newChar
        return newChar
    }
}
