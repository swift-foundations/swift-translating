//
//  Language+System.swift
//  swift-translating
//
//  System language resolution using Foundation's Locale.
//  Lives in Translating Platform because it requires Foundation.
//

import Foundation
import Language
public import BCP_47
public import RFC_5646

extension BCP47.LanguageTag {
    /// Returns the user's preferred language based on their system locale.
    public static var preferred: Self {
        let identifier = Locale.current.language.languageCode?.identifier ?? "en"
        return (try? Self(identifier)) ?? .english
    }
}
