//
//  Language+System.swift
//  swift-translating
//
//  System language resolution using Foundation's Locale.
//  Lives in Translating Platform because it requires Foundation.
//

public import BCP_47
import Foundation
import Language
public import RFC_5646

extension BCP47.LanguageTag {
    /// Returns the user's preferred language based on their system locale.
    public static var preferred: Self {
        let identifier = Locale.current.language.languageCode?.identifier ?? "en"
        do throws(RFC_5646.Error) {
            return try Self(identifier)
        } catch {
            return .english
        }
    }
}
