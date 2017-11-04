import Foundation


public struct MorseCoder {

    public let morseCode = "/Users/hyoungsunpark/Desktop/HW5_P2/morse_code.txt" // please change the directory when tested

    public var forEncoding: [String: String] = [:]
    public var forDecoding: [String: String] = [:]

    public init() {
        self.forDecoding = decodingMsg(fileName: morseCode)
        self.forEncoding = encodingMsg(fileName: morseCode)
    }


    private func encodingMsg(fileName: String) -> [String: String] {
        var code: [String: String] = [:]
        do {
            let data = try String(contentsOfFile: fileName, encoding: String.Encoding.utf8)
            for line in data.components(separatedBy: .newlines) {
                var charArray = [Character](line.characters)
                code[String(charArray[0]).lowercased()] = String(charArray[4..<charArray.count].dropLast())
            }
        }
        catch {
            print("Error: \(error)")
        }
        return code
    }

    // create another morese_code dictionary for decoding
    private func decodingMsg(fileName: String) -> [String: String] {
        var code: [String: String] = [:]
        do {
            let data = try String(contentsOfFile: fileName, encoding: String.Encoding.utf8)
            for line in data.components(separatedBy: .newlines) {
                var charArray = [Character](line.characters)
                code[String(charArray[4..<charArray.count-1])] = String(charArray[0])
            }
        }
        catch {
            print("Error: \(error)")
        }
        return code
    }

    public func encodeMsg(yourMsg: String) -> String {
        var result = ""
        for each in yourMsg {
            if forEncoding.keys.contains(String(each).lowercased()) {
                result.append(forEncoding[String(each).lowercased()]! + " ")
            }
        }
        return result
    }

    public func decodeMsg(yourMsg: String) -> String {
        var result2 = ""
        for each in yourMsg.components(separatedBy: .whitespaces) {
            if forDecoding.keys.contains(each) {
                result2.append(forDecoding[each]!.lowercased())
            }
        }
        return result2
    }

}
