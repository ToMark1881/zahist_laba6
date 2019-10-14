import Foundation

let surname = "вдовиченко"
let p = 37
let g = 2
let x = 5
let k = 7

func generateY(p: Int, g: Int, x: Int) -> Int {
    return Int(pow(Double(g), Double(x)).truncatingRemainder(dividingBy: Double(p)))
}

let y = generateY(p: p, g: g, x: x)

func setLetters() -> [Character] {
    var characters = [Character]()
    let chars = ["а", "б", "в", "г", "д", "е", "ё", "ж", "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я"]
    for ch in chars {
        characters.append(Character(ch))
    }
    return characters
}

func generateCyphergramm(from surname: String, and letters: [Character]) -> String {
    var cypergramm = ""
    let yK = pow(Double(y), Double(k))
    for letter in surname {
        let i = (letters.firstIndex(of: letter) ?? 0) + 1
        let b = (yK * Double(i)).truncatingRemainder(dividingBy: Double(p))
        cypergramm.append(b.description + " ")
    }
    return cypergramm
}

print(generateCyphergramm(from: surname, and: setLetters()))


