//
//  String.swift
//  swift-translating
//
//  Foundation-free string helpers for translation-adjacent operations.
//

public import Language

// MARK: - Articles

extension String {
    /// Returns the string with the appropriate indefinite article ("a" or "an") prepended.
    public var any: Self {
        if let first = self.first {
            if Set<String>.vowels.contains(String(first).lowercased()) {
                return "an \(self)"
            } else {
                return "a \(self)"
            }
        }
        return self
    }
}

extension Set where Element == String {
    /// English vowels
    public static let vowels: Self = ["a", "e", "i", "o", "u"]

    /// English consonants
    public static let consonants: Self = [
        "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w",
        "x", "y", "z",
    ]
}

// MARK: - Non-Breaking Space

extension String {
    public static let nonBreakingSpace: Self = "\u{00a0}"

    public func withNonBreakingSpace() -> Self {
        self.replacing(" ", with: "\u{00a0}")
    }
}

// MARK: - Conditional Append

extension String {
    public func `if`(_ bool: Bool, append string: String) -> Self {
        bool ? self + string : self
    }
}

// MARK: - Punctuation

extension String {
    public static func period(_ string: Self) -> Self {
        string.period
    }

    public var period: String {
        guard let last = self.last else { return self }
        if last == "." { return self } else { return self + "." }
    }

    public var semicolon: String {
        guard let last = self.last else { return self }
        if last == ";" { return self } else { return self + ";" }
    }

    public var colon: String {
        guard let last = self.last else { return self }
        if last == ":" { return self } else { return self + ":" }
    }

    public var comma: String {
        guard let last = self.last else { return self }
        if last == "," { return self } else { return self + "," }
    }

    public var questionmark: String {
        guard let last = self.last else { return self }
        if last == "?" { return self } else { return self + "?" }
    }
}

// MARK: - Case Transforms

extension String {
    public func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
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

    public var uppercasingFirst: String {
        return prefix(1).uppercased() + dropFirst()
    }

    public var lowercasingFirst: String {
        return prefix(1).lowercased() + dropFirst()
    }
}

// MARK: - Placeholder

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

    public static func placeholder(
        _ size: String.Placeholder.Size,
        _ string: String = .space
    )
        -> String
    {
        switch size {
        case .large: return String(repeating: string, count: 40)
        case .medium: return String(repeating: string, count: 22)
        case .small: return String(repeating: string, count: 10)
        }
    }
}

// MARK: - Truncation

extension String {
    public func trunc(length: Int, trailing: String = "…") -> String {
        return (self.count > length) ? self.prefix(length) + trailing : self
    }

    public func ifEmpty(_ string: String) -> String {
        return !(self.isEmpty) ? self : string
    }

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

// MARK: - Pluralization

extension String {
    public func plural<A: Collection>(_ plural: String, _ collection: A) -> Self {
        collection.count == 1 ? self : plural
    }
}
