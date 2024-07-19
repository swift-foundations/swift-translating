//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation
import Language

extension TranslatedString {
    public init(_ language: Language) {
        switch language {
        case .abkhazian: self = .init(
            english: "abkhazian"
        )
        case .afar: self = .init(
            english: "afar"
        )
        case .afrikaans: self = .init(
            english: "afrikaans"
        )
        case .akan: self = .init(
            english: "akan"
        )
        case .albanian: self = .init(
            english: "albanian"
        )
        case .amharic: self = .init(
            english: "amharic"
        )
        case .arabic: self = .init(
            arabic: "عربي",
            english: "Arabic"
        )
        case .aragonese: self = .init(
            english: "aragonese"
        )
        case .armenian: self = .init(
            english: "armenian"
        )
        case .assamese: self = .init(
            english: "assamese"
        )
        case .auEnglish: self = .init(
            english: "Australian English"
        )
        case .avaric: self = .init(
            english: "avaric"
        )
        case .avestan: self = .init(
            english: "avestan"
        )
        case .aymara: self = .init(
            english: "aymara"
        )
        case .azerbaijani: self = .init(
            english: "azerbaijani"
        )
        case .bambara: self = .init(
            english: "bambara"
        )
        case .bashkir: self = .init(
            english: "bashkir"
        )
        case .basque: self = .init(
            english: "basque"
        )
        case .belarusian: self = .init(
            english: "belarusian"
        )
        case .bengali: self = .init(
            bengali: "বাংলা",
            english: "Bengali"
        )
        case .bihari: self = .init(
            english: "bihari"
        )
        case .bislama: self = .init(
            english: "bislama"
        )
        case .bosnian: self = .init(
            english: "bosnian"
        )
        case .breton: self = .init(
            english: "breton"
        )
        case .bulgarian: self = .init(
            english: "bulgarian"
        )
        case .burmese: self = .init(
            english: "burmese"
        )
        case .catalan: self = .init(
            english: "catalan"
        )
        case .caEnglish: self = .init(
            english: "caEnglish"
        )
        case .chamorro: self = .init(
            english: "chamorro"
        )
        case .chechen: self = .init(
            english: "chechen"
        )
        case .chinese: self = .init(
            chinese: "中国人",
            english: "Chinese"
        )
        case .chuvash: self = .init(
            english: "chuvash"
        )
        case .cornish: self = .init(
            english: "cornish"
        )
        case .corsican: self = .init(
            english: "corsican"
        )
        case .cree: self = .init(
            english: "cree"
        )
        case .croatian: self = .init(
            english: "croatian"
        )
        case .czech: self = .init(
            english: "czech"
        )
        case .danish: self = .init(
            danish: "dansk",
            english: "Danish"
        )
        case .dutch: self = .init(
            dutch: "Nederlands",
            english: "Dutch",
            french: "Néerlandais",
            german: "Niederländisch",
            spanish: "Holandés"
        )
        case .dzongkha: self = .init(
            english: "dzongkha"
        )
        case .english: self = .init(
            dutch: "Engels",
            english: "English",
            french: "Anglais",
            german: "Englisch",
            spanish: "Inglés"
        )
        case .esperanto: self = .init(
            english: "esperanto"
        )
        case .estonian: self = .init(
            english: "estonian"
        )
        case .ewe: self = .init(
            english: "ewe"
        )
        case .faroese: self = .init(
            english: "faroese"
        )
        case .fijian: self = .init(
            english: "fijian"
        )
        case .finnish: self = .init(
            english: "finnish"
        )
        case .french: self = .init(
            dutch: "Frans",
            english: "French",
            french: "Français",
            german: "Französisch",
            spanish: "Francés"
        )
        case .galician: self = .init(
            english: "galician"
        )
        case .gaelicScottish: self = .init(
            english: "gaelicScottish"
        )
        case .georgian: self = .init(
            english: "georgian"
        )
        case .german: self = .init(
            dutch: "Duits",
            english: "German",
            french: "Allemand",
            german: "Deutsch",
            spanish: "Alemán"
        )
        case .greek: self = .init(
            english: "greek"
        )
        case .guarani: self = .init(
            english: "guarani"
        )
        case .gujarati: self = .init(
            english: "gujarati"
        )
        case .haitianCreole: self = .init(
            english: "haitianCreole"
        )
        case .hausa: self = .init(
            english: "hausa"
        )
        case .hebrew: self = .init(
            english: "hebrew"
        )
        case .herero: self = .init(
            english: "herero"
        )
        case .hindi: self = .init(
            english: "Hindi",
            hindi: "हिंदी"
        )
        case .hiriMotu: self = .init(
            english: "hiriMotu"
        )
        case .hungarian: self = .init(
            english: "hungarian"
        )
        case .icelandic: self = .init(
            english: "icelandic"
        )
        case .ido: self = .init(
            english: "ido"
        )
        case .igbo: self = .init(
            english: "igbo"
        )
        case .indonesian: self = .init(
            english: "indonesian",
            indonesian: "irlandesi"
        )
        case .interlingua: self = .init(
            english: "interlingua"
        )
        case .interlingue: self = .init(
            english: "interlingue"
        )
        case .inuktitut: self = .init(
            english: "inuktitut"
        )
        case .inupiak: self = .init(
            english: "inupiak"
        )
        case .irish: self = .init(
            english: "irish"
        )
        case .italian: self = .init(
            english: "Italian",
            italian: "Italiano"
        )
        case .japanese: self = .init(
            english: "Japanese",
            japanese: "日本語"
        )
        case .javanese: self = .init(
            english: "Javanese",
            javanese: "Basa Jawa"
        )
        case .kannada: self = .init(
            english: "kannada"
        )
        case .kanuri: self = .init(
            english: "kanuri"
        )
        case .kashmiri: self = .init(
            english: "kashmiri"
        )
        case .kazakh: self = .init(
            english: "kazakh"
        )
        case .khmer: self = .init(
            english: "khmer"
        )
        case .kikuyu: self = .init(
            english: "kikuyu"
        )
        case .kinyarwanda: self = .init(
            english: "kinyarwanda"
        )
        case .kirundi: self = .init(
            english: "kirundi"
        )
        case .komi: self = .init(
            english: "komi"
        )
        case .kongo: self = .init(
            english: "kongo"
        )
        case .korean: self = .init(
            english: "Korean",
            korean: "한국인"
        )
        case .kurdish: self = .init(
            english: "kurdish"
        )
        case .kwanyama: self = .init(
            english: "kwanyama"
        )
        case .kyrgyz: self = .init(
            english: "kyrgyz"
        )
        case .lao: self = .init(
            english: "lao"
        )
        case .latin: self = .init(
            english: "latin"
        )
        case .latvian: self = .init(
            english: "latvian"
        )
        case .limburgish: self = .init(
            english: "limburgish"
        )
        case .lingala: self = .init(
            english: "lingala"
        )
        case .lithuanian: self = .init(
            english: "lithuanian"
        )
        case .lugaKatanga: self = .init(
            english: "lugaKatanga"
        )
        case .luxembourgish: self = .init(
            english: "luxembourgish"
        )
        case .macedonian: self = .init(
            english: "macedonian"
        )
        case .malagasy: self = .init(
            english: "malagasy"
        )
        case .malay: self = .init(
            english: "malay"
        )
        case .malayalam: self = .init(
            english: "malayalam"
        )
        case .maltese: self = .init(
            english: "maltese"
        )
        case .manx: self = .init(
            english: "manx"
        )
        case .maori: self = .init(
            english: "maori"
        )
        case .marathi: self = .init(
            english: "marathi"
        )
        case .marshallese: self = .init(
            english: "marshallese"
        )
        case .moldavian: self = .init(
            english: "moldavian"
        )
        case .mongolian: self = .init(
            english: "mongolian"
        )
        case .nauru: self = .init(
            english: "nauru"
        )
        case .navajo: self = .init(
            english: "navajo"
        )
        case .ndonga: self = .init(
            english: "ndonga"
        )
        case .nepali: self = .init(
            english: "nepali"
        )
        case .northernNdebele: self = .init(
            english: "northernNdebele"
        )
        case .norwegian: self = .init(
            english: "norwegian"
        )
        case .norwegianBokmål: self = .init(
            english: "norwegianBokmål"
        )
        case .norwegianNynorsk: self = .init(
            english: "norwegianNynorsk"
        )
        case .occitan: self = .init(
            english: "occitan"
        )
        case .ojibwe: self = .init(
            english: "ojibwe"
        )
        case .oriya: self = .init(
            english: "oriya"
        )
        case .oromo: self = .init(
            english: "oromo"
        )
        case .ossetian: self = .init(
            english: "ossetian"
        )
        case .pāli: self = .init(
            english: "pāli"
        )
        case .persian: self = .init(
            english: "persian"
        )
        case .polish: self = .init(
            english: "Polish",
            polish: "Polski"
        )
        case .portuguese: self = .init(
            english: "Portuguese",
            portuguese: "Português"
        )
        case .punjabi: self = .init(
            english: "punjabi"
        )
        case .quechua: self = .init(
            english: "quechua"
        )
        case .romanian: self = .init(
            english: "Romanian",
            romanian: "Română"
        )
        case .romansh: self = .init(
            english: "romansh"
        )
        case .russian: self = .init(
            english: "Russian",
            russian: "Pусский"
        )
        case .sami: self = .init(
            english: "sami"
        )
        case .samoan: self = .init(
            english: "samoan"
        )
        case .sango: self = .init(
            english: "sango"
        )
        case .sanskrit: self = .init(
            english: "sanskrit"
        )
        case .serbian: self = .init(
            english: "serbian"
        )
        case .serboCroatian: self = .init(
            english: "serboCroatian"
        )
        case .sesotho: self = .init(
            english: "sesotho"
        )
        case .setswana: self = .init(
            english: "setswana"
        )
        case .shona: self = .init(
            english: "shona"
        )
        case .sindhi: self = .init(
            english: "sindhi"
        )
        case .sinhalese: self = .init(
            english: "sinhalese"
        )
        case .slovak: self = .init(
            english: "Slovak",
            slovak: "slovenský"
        )
        case .slovenian: self = .init(
            english: "Slovenian",
            slovenian: "Slovenščina"
        )
        case .somali: self = .init(
            english: "somali"
        )
        case .southernNdebele: self = .init(
            english: "southernNdebele"
        )
        case .spanish: self = .init(
            dutch: "Spaans",
            english: "Spanish",
            french: "Espagnol",
            german: "Spanisch",
            spanish: "Espagnol"
        )
        case .sundanese: self = .init(
            english: "sundanese"
        )
        case .swahili: self = .init(
            english: "swahili"
        )
        case .swati: self = .init(
            english: "swati"
        )
        case .swedish: self = .init(
            english: "Swedish",
            swedish: "Tvåds"
        )
        case .tagalog: self = .init(
            english: "tagalog"
        )
        case .tahitian: self = .init(
            english: "tahitian"
        )
        case .tajik: self = .init(
            english: "tajik"
        )
        case .tamil: self = .init(
            english: "tamil"
        )
        case .tatar: self = .init(
            english: "tatar"
        )
        case .telugu: self = .init(
            english: "telugu"
        )
        case .thai: self = .init(
            english: "thai"
        )
        case .tibetan: self = .init(
            english: "tibetan"
        )
        case .tigrinya: self = .init(
            english: "tigrinya"
        )
        case .tonga: self = .init(
            english: "tonga"
        )
        case .tsonga: self = .init(
            english: "tsonga"
        )
        case .turkish: self = .init(
            english: "Turkish",
            turkish: "Türkçe"
        )
        case .turkmen: self = .init(
            english: "turkmen"
        )
        case .twi: self = .init(
            english: "twi"
        )
        case .ukEnglish: self = .init(
            english: "ukEnglish"
        )
        case .ukrainian: self = .init(
            english: "ukrainian"
        )
        case .urdu: self = .init(
            english: "urdu"
        )
        case .usEnglish: self = .init(
            english: "usEnglish"
        )
        case .uyghur: self = .init(
            english: "uyghur"
        )
        case .uzbek: self = .init(
            english: "uzbek"
        )
        case .venda: self = .init(
            english: "venda"
        )
        case .vietnamese: self = .init(
            english: "vietnamese"
        )
        case .volapük: self = .init(
            english: "volapük"
        )
        case .wallon: self = .init(
            english: "wallon"
        )
        case .welsh: self = .init(
            english: "welsh"
        )
        case .westernFrisian: self = .init(
            english: "westernFrisian"
        )
        case .wolof: self = .init(
            english: "wolof"
        )
        case .xhosa: self = .init(
            english: "xhosa"
        )
        case .yoruba: self = .init(
            english: "yoruba"
        )
        case .zulu: self = .init(
            english: "zulu"
        )
        }
    }
}

public extension Language {
    var name: TranslatedString {
        return .init(self)
    }
}
