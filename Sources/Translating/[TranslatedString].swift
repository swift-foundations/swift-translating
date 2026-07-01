//
//  File.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

public import Translated
public import Translated_String

extension [TranslatedString] {
    public func joined(separator: [String].Separator) -> TranslatedString {
        .init { language in
            self.map { $0(language) }.joined(separator: separator)(language)
        }
    }

    public func joined(separator: String) -> TranslatedString {
        .init { language in
            self.map { $0(language) }.joined(separator: separator)
        }
    }
}
