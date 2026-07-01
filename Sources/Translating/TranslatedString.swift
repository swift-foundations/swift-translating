//
//  TranslatedString.swift
//  swift-translating
//

public import Language
public import Translated

extension TranslatedString {

    public var period: Self {
        self.map(\.period)
    }

    public var comma: Self {
        self.map(\.comma)
    }

    public var semicolon: Self {
        self.map(\.semicolon)
    }

    public var colon: Self {
        self.map(\.colon)
    }

    public var questionmark: Self {
        self.map(\.questionmark)
    }

    public var isEmpty: Bool {
        self.english.isEmpty && self.dutch.isEmpty
    }

    public var capitalized: Self {
        self.map { $0.capitalizingFirstLetter() }
    }

    @available(*, deprecated, message: "Renamed to capitalizingFirstLetter()")
    public func capitalizedFirstLetter() -> Self {
        self.capitalizingFirstLetter()
    }

    public func capitalizingFirstLetter() -> Self {
        self.map { $0.prefix(1).uppercased() + $0.dropFirst() }
    }

    public func firstLetter(_ closure: (String) -> String) -> Self {
        self.map { closure(String($0.prefix(1))) + $0.dropFirst() }
    }
}
