//
//  Language+Locale.swift
//  swift-translating
//
//  Locale bridge for Translating Platform. Provides Language → Foundation.Locale
//  conversion needed by date formatting code.
//

import Foundation
import Language

extension Language {
    /// Returns a Foundation Locale derived from this language tag's string value.
    var locale: Foundation.Locale {
        Foundation.Locale(identifier: String(describing: self))
    }
}
