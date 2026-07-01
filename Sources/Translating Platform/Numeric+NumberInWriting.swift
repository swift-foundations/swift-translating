//
//  Numeric+NumberInWriting.swift
//  swift-translating
//
//  Spell-out formatting for numbers using Foundation's NumberFormatter.
//  Lives in Translating Platform because it requires Foundation.
//

import Foundation
public import Language

extension Numeric {
    public func numberInWriting(language: Language) -> String {
        Self.numberInWriting(self, language: language)
    }

    public static func numberInWriting(_ value: Self, language: Language) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        formatter.locale = language.locale
        return formatter.string(for: value)!
    }
}
