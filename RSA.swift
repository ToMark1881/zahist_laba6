import Foundation

let a = 7
let b = 13

let surname = "вдовиченко"

func setLetters() -> [Character] {
    var characters = [Character]()
    let chars = ["а", "б", "в", "г", "д", "е", "ё", "ж", "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я"]
    for ch in chars {
        characters.append(Character(ch))
    }
    return characters
}

func generateModule(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func generateEuler(_ a: Int, _ b: Int) -> Int {
    return ((a - 1) * (b - 1))
}

func generateOpenKeyE() -> Int {
    //let keys = [1, 2, 3, 5, 7]
    //return keys.randomElement() ?? 1
    return 5
}

let n = generateModule(a, b)
let nu = generateEuler(a, b)
let e = generateOpenKeyE()

func generateClosedKeyD(from e: Int) -> Int {
    var d = e
    repeat {
        d += 1
    }
    while ((d * e) % nu) != 1
    return d
}

let d = generateClosedKeyD(from: e)

func generateCyphergramm(from surname: String, and letters: [Character]) -> (cyphergramm: String, message: String) {
    var cypergramm = ""
    var message = ""
    for letter in surname {
        let i = (letters.firstIndex(of: letter) ?? 0) + 1
        let ie = pow(Double(i), Double(e))
        print(ie)
        let num = Int64(ie) % Int64(n)
        cypergramm.append(num.description + " ")
        let numD = pow(Double(num), Double(d))
        print(numD)
        let num2 = numD.truncatingRemainder(dividingBy: Double(n))
        message.append(num2.description + " ")
    }
    return (cypergramm, message)
}

print(generateCyphergramm(from: surname, and: setLetters()))
