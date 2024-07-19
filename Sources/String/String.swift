//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 11/06/2024.
//

import Foundation
import Language

extension String {
    public static let period: Self = "."
    public static let comma: Self = ","
    public static let semicolon: Self = ";"
    public static let questionmark: Self = "?"
    public static let space: Self = "\u{00a0}"
    public static let tab: Self = "\u{0009}"
}


extension String {
    public var any: Self {
        if let first = self.first {
            if Set<String>.consonents.contains(String(first)) {return "an \(self)"} else { return "a \(self)" }
        }
        return self
    }
}

extension Set where Element == String {
    public static let consonents: Self = [
        "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"
    ]
}

public extension String {
    static let nonBreakingSpace: Self = "\u{00a0}"
}

// public extension String {
//    func print()->Void {
//        Swift.print(self)
//    }
// }

public extension String {
    func normalized() -> String {
        //        let lowercased = self.lowercased()
        let withoutDiacritics = self.folding(options: .diacriticInsensitive, locale: .current)
        let withoutSpecialCharacters = withoutDiacritics.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
        let standardizedWhiteSpace = withoutSpecialCharacters.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
        return standardizedWhiteSpace
    }
}

public extension String {
    func withNonBreakingSpace() -> Self {
        self.replacingOccurrences(of: " ", with: "\u{00a0}")
    }
}

public extension String {
    func `if`(_ bool: Bool, append string: String) -> Self {
        bool ? self + string : self
    }
}

extension String {
    public func write(
        toFile url: URL,
        atomically useAuxiliaryFile: Bool = true,
        encoding: String.Encoding = .utf8,
        withDirectoryCreation: Bool = true
    ) throws {
        let fileManager = FileManager.default
        
        if withDirectoryCreation {
            let directoryURL = url.deletingLastPathComponent()
            
            if !fileManager.fileExists(atPath: directoryURL.path) {
                try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
            }
        }
        
        try self.write(to: url, atomically: useAuxiliaryFile, encoding: encoding)
    }
}


extension String {
    public static func slug(for string: String) -> String {
        string
            .lowercased()
            .replacingOccurrences(of: "[\\W]+", with: "-", options: .regularExpression)
            .replacingOccurrences(of: "^-|-$", with: "", options: .regularExpression)
    }
    
    public func slug() -> String {
        String.slug(for: self)
    }
}

extension String {
    public func plural<A: Collection>(_ plural: String, _ collection: A) -> Self {
        collection.count == 1 ? self : plural
    }
    
    public func filePathSafe() -> Self {
        self.trunc(length: 250, trailing: "...")
    }
}

extension String {
    public static func period(_ string: Self) -> Self {
        string.period
    }
    
    public var period: String {
        guard let last = self.last else {return self}
        if last == "." {return self} else {return self + "."}
    }
    
    public var semicolon: String {
        guard let last = self.last else {return self}
        if last == ";" {return self} else {return self + ";"}
    }
    
    public var colon: String {
        guard let last = self.last else {return self}
        if last == ":" {return self} else {return self + ":"}
    }
    
    public var comma: String {
        guard let last = self.last else {return self}
        if last == "," {return self} else {return self + ","}
    }
    
    public var questionmark: String {
        guard let last = self.last else {return self}
        if last == "?" {return self} else {return self + "?"}
    }
}

public extension Int {
    func toPostCodeString(withSize size: Int) -> String {
        guard self >= 0 else { fatalError() }
        let str = String(format: "%0\(size)d", self)
        return String(str.suffix(size))
    }
}

extension String {
    public static func kvk(_ int: Int) -> Self {
        switch int {
        case 0...9: return "0000000\(int)"
        case 10...99: return "000000\(int)"
        case 100...999: return "00000\(int)"
        case 1000...9999: return "0000\(int)"
        case 10000...99999: return "000\(int)"
        case 100000...999999: return "00\(int)"
        case 1000000...9999999: return "0\(int)"
        case 10000000...99999999: return "\(int)"
        default: fatalError()
        }
    }
}

extension String {
    public func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    public mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    public func lowercasingFirstLetter() -> String {
        return prefix(1).lowercased() + dropFirst()
    }
    
    public mutating func lowercaseFirstLetter() {
        self = self.lowercasingFirstLetter()
    }
}

extension String {
    public enum Placeholder {
        public enum Size {
            case large
            case medium
            case small
        }
    }
    
    public static let placeholder: String = String.placeholder(.medium)
    
    public static func placeholder(_ characters: Int, _ string: String = .space) -> String {
        return String(repeating: string, count: characters)
    }
    
    public static func placeholder(_ size: Placeholder.Size, _ string: String = .space) -> String {
        switch size {
        case .large: return String(repeating: string, count: 40)
        case .medium: return String(repeating: string, count: 22)
        case .small: return String(repeating: string, count: 10)
        }
    }
}


extension String {
    
    /*
     Truncates the string to the specified length number of characters and appends an optional trailing string if longer.
     - Parameter length: Desired maximum lengths of a string
     - Parameter trailing: A 'String' that will be appended after the truncation.
     
     - Returns: 'String' object.
     */
    public func trunc(length: Int, trailing: String = "…") -> String {
        return (self.count > length) ? self.prefix(length) + trailing : self
    }
    
    public func ifEmpty(_ string: String) -> String {
        return !(self.isEmpty) ? self : string
    }
}

extension String {
    public var uppercasingFirst: String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    public var lowercasingFirst: String {
        return prefix(1).lowercased() + dropFirst()
    }
    
    public var camelized: String {
        guard !isEmpty else {
            return ""
        }
        
        let parts = self.components(separatedBy: CharacterSet.alphanumerics.inverted)
        
        let first = String(describing: parts.first!).lowercasingFirst
        let rest = parts.dropFirst().map({ String($0).uppercasingFirst })
        
        return ([first] + rest).joined(separator: "")
    }
}

extension String {
    public func isAlphanumeric() -> Bool {
        return self.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && self != ""
    }
    
    public func isAlphanumeric(ignoreDiacritics: Bool = false) -> Bool {
        if ignoreDiacritics {
            return self.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil && self != ""
        } else {
            return self.isAlphanumeric()
        }
    }
}

public extension String {
    func typeName() -> String {
        let components = self.components(separatedBy: CharacterSet.whitespacesAndNewlines).map { $0.normalized() }
        
        let transformedComponents = components.map { component -> String in
            var transformedComponent = component.replacingOccurrences(of: "[^a-zA-Z0-9]", with: "", options: .regularExpression)
            if let firstChar = transformedComponent.first {
                transformedComponent = String(firstChar).capitalized + transformedComponent.dropFirst()
            }
            return transformedComponent
        }
        
        let transformedString = transformedComponents.joined()
        
        let regex = try! NSRegularExpression(pattern: "(\\p{Uppercase})(\\p{Uppercase}+)(?!\\p{Lowercase})")
        let range = NSRange(location: 0, length: transformedString.utf16.count)
        let updatedString = regex.stringByReplacingMatches(in: transformedString,
                                                           options: [],
                                                           range: range,
                                                           withTemplate: "$1$2")
        
        return updatedString
    }
}

public extension String {
    func variableName() -> String {
        let normalizedString = self
            .folding(options: .diacriticInsensitive, locale: .current)
            .replacingOccurrences(of: "-", with: "_")
            .replacingOccurrences(of: " ", with: "_")
        let allowedCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_")
        let filteredString = normalizedString
            .unicodeScalars
            .filter { allowedCharacterSet.contains($0) }
            .map { Character($0) }
            .map { String($0) }
            .joined()
        return filteredString.lowercased()
    }
}

public extension String {
    /// Removes invalid characters and condenses whitespace
    func sanitized() -> String {
        let invalidCharacters = CharacterSet(charactersIn: "\\/:*?\"<>|")
            .union(.newlines)
            .union(.illegalCharacters)
            .union(.controlCharacters)
        
        // Remove invalid characters
        let sanitizedString = self.components(separatedBy: invalidCharacters).joined()
        
        // Condense whitespace
        let condensedString = sanitizedString.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
        
        // Truncate to the maximum filename length
        return condensedString
    }
    
    /// Sanitizes the string by removing invalid characters and condensing whitespace
    mutating func sanitize() {
        self = self.sanitized()
    }
    
    /// Condenses whitespace in the string
    func whitespaceCondensed() -> String {
        return self.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    /// Mutates the string by condensing whitespace
    mutating func condenseWhitespace() {
        self = self.whitespaceCondensed()
    }
    
    func fileName(maxFilenameLength: Int = 150)->Self {
        self.sanitized().truncated(maxFilenameLength: maxFilenameLength)
    }
}

extension String {
    public func truncated(maxFilenameLength: Int, truncationIndicator: String = "[...]") -> String {
        guard self.count > maxFilenameLength else { return self }
        
        let truncatedLength = maxFilenameLength - truncationIndicator.count
        guard truncatedLength > 0 else { return truncationIndicator }
        
        let startIndex = self.startIndex
        let endIndex = self.index(startIndex, offsetBy: truncatedLength / 2)
        let secondStartIndex = self.index(self.endIndex, offsetBy: -truncatedLength / 2)
        
        let firstPart = self[startIndex..<endIndex]
        let secondPart = self[secondStartIndex..<self.endIndex]
        
        return "\(firstPart)\(truncationIndicator)\(secondPart)"
    }
}

extension String {
    public func importTitle() -> String {
        let invalidCharacters = CharacterSet.alphanumerics.inverted
        let sanitizedString = self.unicodeScalars.map { invalidCharacters.contains($0) ? "_" : Character($0) }.reduce("") { $0 + String($1) }
        return sanitizedString
    }
}



