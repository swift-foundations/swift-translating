public import Language
public import Translated

public typealias TranslatedString = Translated<String>

extension TranslatedString: ExpressibleByUnicodeScalarLiteral {
    public init(unicodeScalarLiteral value: String) {
        self.init(value)
    }

    public typealias UnicodeScalarLiteralType = String

}

extension TranslatedString: ExpressibleByExtendedGraphemeClusterLiteral {
    public typealias ExtendedGraphemeClusterLiteralType = String

}

extension TranslatedString: ExpressibleByStringLiteral & ExpressibleByStringInterpolation {
    public init(stringLiteral value: String) {
        self.init(value)
    }
}

extension TranslatedString {
    public static let empty: Self = TranslatedString(stringLiteral: "")
}

extension TranslatedString {

    public init(dictionaryLiteral elements: (Language, String)...) {
        if elements.isEmpty {
            self = Self.empty
        } else {
            let dictionary = Dictionary(uniqueKeysWithValues: elements)

            let defaultValue = dictionary[.english] ?? elements.first!.1

            self.init(default: defaultValue, dictionary: dictionary)
        }
    }
}
