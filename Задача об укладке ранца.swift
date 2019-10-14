class Letter {
    let ascii: Int
    let binary: UInt8
    
    init(ascii: Int, binary: UInt8) {
        self.ascii = ascii
        self.binary = binary
    }
}

let newLetters = ["а", "б", "в", "г", "д", "е", "ж", "з", "и", "й", "к", "л",
    "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "ъ",
    "ы", "ь", "э", "ю", "я"]
let closedKeys = [2, 3, 6, 13, 27, 52, 105, 210]
let n = 31
let m = 420

func generateOpenKeys(from keys: [Int]) -> [Int] {
    var newKeys = [Int]()
    for key in keys {
        let newKey = (key * n) % m
        newKeys.append(newKey)
    }
    return newKeys
}

func generateDict(_ array: [String], startIndex: Int = 0) -> [String: Int] {
    var lettersDict = [String: Int]()
    var index = startIndex
    for letter in array {
        lettersDict.updateValue(index, forKey: letter)
        index += 1
    }
return lettersDict
}

let dictFromNewLetters = generateDict(newLetters, startIndex: 192)

func pad(string : String, toSize: Int) -> String {
    var padded = string
    for _ in 0..<(toSize - string.count) {
        padded = "0" + padded
    }
    return padded
}

func generateBinaryDict(from dict: [String : Int]) -> [String: Letter] {
    var dictToReturn = [String : Letter]()
    for line in dict {
        let key = line.key
        let value = line.value
        let letter = Letter(ascii: value, binary: UInt8(value))
        dictToReturn.updateValue(letter, forKey: key)
    }
    return dictToReturn
}

let binaryDict = generateBinaryDict(from: dictFromNewLetters)

let surname = "вдовиченко"


class NewLetter {
    let ascii: Int
    let binary: String
    
    init(ascii: Int, binary: String) {
        self.ascii = ascii
        self.binary = binary
    }
}

func generateBinaryFrom(_ binary: [String : Letter]) -> [String : NewLetter] {
    var newDict = [String: NewLetter]()
    for index in surname.indices {
        let surnameLetter = surname[index]
        guard let sL = binaryDict[String(surnameLetter)] else {return newDict}
        let num = sL.binary
        let binaryStr = String(num, radix: 2)
        let padded = pad(string: binaryStr, toSize: 8)
        
        newDict.updateValue(NewLetter(ascii: sL.ascii, binary: padded), forKey: String(surnameLetter))
    }
    return newDict
}

let newDict = generateBinaryFrom(binaryDict)
let openKeys = generateOpenKeys(from: closedKeys)

func getValueFromKnapsack(from binary: String) -> Int {
    var num = 0
    let array = Array(binary)
    for index in array.indices {
        let letter = array[index]
        if letter == Character("1") {
            let v = openKeys[index]
            num += v
        }
        else {
            continue
        }
    }
    return num
}

func getSolution(from dict: [String : NewLetter]) {
    for d in dict {
        let value = getValueFromKnapsack(from: d.value.binary)
        print(d.key, value, d.value.binary)
    }
}

getSolution(from: newDict)

