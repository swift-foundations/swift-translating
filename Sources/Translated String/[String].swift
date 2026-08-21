import Language

extension [String] {

    public static let alphabet: Self = [
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
        "s",
        "t", "u", "v", "w", "x", "y", "z",
    ]

    public enum Separator: Sendable {
        case and
        case or
        case andOr
    }
}

extension [String].Separator {
    public static let orSeparator: Self = .or
}

extension TranslatedString {
    public init(_ separator: [String].Separator) {
        switch separator {
        case .and:
            self = [.english: "and"]

        case .or:
            self = [.english: "or"]

        case .andOr:
            self = [.english: "and/or"]
        }
    }
}
