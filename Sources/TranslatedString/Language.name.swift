//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation
import Language

public extension Language {
    var name: Translated<String> {
        switch self {
        case .arabic: .init(
            arabic: "عربي",
            english: "Arabic"
        )
        case .bengali: .init(
            bengali: "বাংলা",
            english: "Bengali"
        )
        case .chinese: .init(
            chinese: "中国人",
            english: "Chinese"
        )
        case .danish: .init(
            danish: "dansk",
            english: "Danish"
        )
        case .dutch: .init(
            dutch: "Nederlands",
            english: "Dutch",
            french: "Néerlandais",
            german: "Niederländisch",
            spanish: "Holandés"
        )
        case .english: .init(
            dutch: "Engels",
            english: "English",
            french: "Anglais",
            german: "Englisch",
            spanish: "Inglés"
        )
        case .french: .init(
            dutch: "Frans",
            english: "French",
            french: "Français",
            german: "Französisch",
            spanish: "Francés"
        )
        case .german: .init(
            dutch: "Duits",
            english: "German",
            french: "Allemand",
            german: "Deutsch",
            spanish: "Alemán"
        )
        case .hindi: .init(
            english: "Hindi",
            hindi: "हिंदी"
        )
        case .indonesian: .init(
            english: "indonesian",
            indonesian: "irlandesi"
        )
        case .italian: .init(
            english: "Italian",
            italian: "Italiano"
        )
        case .japanese: .init(
            english: "Japanese",
            japanese: "日本語"
        )
        case .javanese: .init(
            english: "Javanese",
            javanese: "Basa Jawa"
        )
        case .korean: .init(
            english: "Korean",
            korean: "한국인"
        )
        case .polish: .init(
            english: "Polish",
            polish: "Polski"
        )
        case .portuguese: .init(
            english: "Portuguese",
            portuguese: "Português"
        )
        case .romanian: .init(
            english: "Romanian",
            romanian: "Română"
        )
        case .russian: .init(
            english: "Russian",
            russian: "Pусский"
        )
        case .slovak: .init(
            english: "Slovak",
            slovak: "slovenský"
        )
        case .slovenian: .init(
            english: "Slovenian",
            slovenian: "Slovenščina"
        )
        case .spanish: .init(
            dutch: "Spaans",
            english: "Spanish",
            french: "Espagnol",
            german: "Spanisch",
            spanish: "Espagnol"
        )
        case .swedish: .init(
            english: "Swedish",
            swedish: "Tvåds"
        )
        case .turkish: .init(
            english: "Turkish",
            turkish: "Türkçe"
        )
        }
    }

    func label(_ length: LabelLength = .normal) -> Translated<String> {

        switch length {
        case .short: .init(self.rawValue)
        case .normal: self.name
        }
    }
}
