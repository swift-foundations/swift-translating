//
//  File.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Foundation
import Language
import Translated

public extension TranslatedString {

    var period: Self {
        self.map(\.period)
    }

    var comma: Self {
        self.map(\.comma)
    }

    var semicolon: Self {
        self.map(\.semicolon)
    }

    var colon: Self {
        self.map(\.colon)
    }

    var questionmark: Self {
        self.map(\.questionmark)
    }

    var isEmpty: Bool {
        self.english.isEmpty && self.dutch.isEmpty
    }

    var capitalized: Self {
        self.map(\.capitalized)
    }

    func capitalized(with locale: Locale? = nil) -> Self {
        self.map { $0.capitalized(with: locale) }
    }

    func uppercased(with locale: Locale? = nil) -> Self {
        self.map { $0.uppercased(with: locale) }
    }

    @available(*, deprecated, message: "Renamed to capitalizingFirstLetter()")
    func capitalizedFirstLetter() -> Self {
        self.capitalizingFirstLetter()
    }

    func capitalizingFirstLetter() -> Self {

        self.map { $0.prefix(1).capitalized + $0.dropFirst() }
    }

    func firstLetter(_ closure: (String) -> String) -> Self {

        self.map { closure(String($0.prefix(1))) + $0.dropFirst() }

    }

    func lowercased(with locale: Locale? = nil) -> Self {
        self.map { $0.lowercased(with: locale) }
    }
}

extension Translated<String> {
    public func slug(
        language: Language = {
            @Dependency(\.language) var language
            return language
        }()
    ) -> String {
        self(language).slug()
    }
}
