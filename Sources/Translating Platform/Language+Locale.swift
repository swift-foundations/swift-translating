//
//  Language+Locale.swift
//  swift-translating
//
//  Locale bridge for Translating Platform. Provides Language → Foundation.Locale
//  conversion needed by date formatting code.
//

public import Foundation
import Language

extension Language {
    /// Returns a Foundation Locale derived from this language tag's string value.
    ///
    /// Public because the language-dependent date formatting that consumes this
    /// bridge lives in swift-translating-dependencies (decomposition W3).
    public var locale: Foundation.Locale {
        Foundation.Locale(identifier: String(describing: self))
    }
}
