//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 13/12/2020.
//

import Foundation
import Language

public struct Translated<A> {
    public var `default`: A
    internal var dictionary: [Language: A]

    internal init(
        `default`: A,
        dictionary: [Language: A]
    ) {
        self.default = `default`
        self.dictionary = dictionary
    }
}

extension Translated {
    public subscript(language: Language) -> A {
        get {
            dictionary[language] ?? self.default
        }
        set {
            dictionary[language] = newValue
        }
    }
}

extension Translated {
    var allCases: [A] {
        self.dictionary.compactMap { $0.value }
    }
}

extension Translated {
    public var abkhazian: A {
        get {
            dictionary[.abkhazian] ?? dictionary[.russian] ?? dictionary[.georgian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.abkhazian] = newValue
        }
    }
    public var afar: A {
        get {
            dictionary[.afar] ?? dictionary[.amharic] ?? dictionary[.oromo] ?? dictionary[.somali] ?? dictionary[.tigrinya] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.afar] = newValue
        }
    }
    public var afrikaans: A {
        get {
            dictionary[.afrikaans] ?? dictionary[.dutch] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.afrikaans] = newValue
        }
    }

    public var akan: A {
        get {
            dictionary[.akan] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.akan] = newValue
        }
    }
    public var albanian: A {
        get {
            dictionary[.albanian] ?? dictionary[.italian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.albanian] = newValue
        }
    }

    public var amharic: A {
        get {
            dictionary[.amharic] ?? dictionary[.oromo] ?? dictionary[.somali] ?? dictionary[.tigrinya] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.amharic] = newValue
        }
    }

    public var arabic: A {
        get {
            dictionary[.arabic] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.arabic] = newValue
        }
    }

    public var aragonese: A {
        get {
            dictionary[.aragonese] ?? dictionary[.spanish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.aragonese] = newValue
        }
    }

    public var armenian: A {
        get {
            dictionary[.armenian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.armenian] = newValue
        }
    }

    public var assamese: A {
        get {
            dictionary[.assamese] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.assamese] = newValue
        }
    }

    public var auEnglish: A {
        get {
            dictionary[.auEnglish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.auEnglish] = newValue
        }
    }

    public var avaric: A {
        get {
            dictionary[.avaric] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.avaric] = newValue
        }
    }

    public var avestan: A {
        get {
            dictionary[.avestan] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.avestan] = newValue
        }
    }

    public var aymara: A {
        get {
            dictionary[.aymara] ?? dictionary[.spanish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.aymara] = newValue
        }
    }

    public var azerbaijani: A {
        get {
            dictionary[.azerbaijani] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.azerbaijani] = newValue
        }
    }

    public var bambara: A {
        get {
            dictionary[.bambara] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.bambara] = newValue
        }
    }

    public var bashkir: A {
        get {
            dictionary[.bashkir] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.bashkir] = newValue
        }
    }

    public var basque: A {
        get {
            dictionary[.basque] ?? dictionary[.spanish] ?? dictionary[.french] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.basque] = newValue
        }
    }

    public var belarusian: A {
        get {
            dictionary[.belarusian] ?? dictionary[.russian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.belarusian] = newValue
        }
    }

    public var bengali: A {
        get {
            dictionary[.bengali] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.bengali] = newValue
        }
    }

    public var bihari: A {
        get {
            dictionary[.bihari] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.bihari] = newValue
        }
    }

    public var bislama: A {
        get {
            dictionary[.bislama] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.bislama] = newValue
        }
    }

    public var bosnian: A {
        get {
            dictionary[.bosnian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.bosnian] = newValue
        }
    }

    public var breton: A {
        get {
            dictionary[.breton] ?? dictionary[.french] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.breton] = newValue
        }
    }

    public var bulgarian: A {
        get {
            dictionary[.bulgarian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.bulgarian] = newValue
        }
    }

    public var burmese: A {
        get {
            dictionary[.burmese] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.burmese] = newValue
        }
    }

    public var catalan: A {
        get {
            dictionary[.catalan] ?? dictionary[.spanish] ?? dictionary[.french] ?? dictionary[.portuguese] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.catalan] = newValue
        }
    }

    public var caEnglish: A {
        get {
            dictionary[.caEnglish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.caEnglish] = newValue
        }
    }

    public var chamorro: A {
        get {
            dictionary[.chamorro] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.chamorro] = newValue
        }
    }

    public var chechen: A {
        get {
            dictionary[.chechen] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.chechen] = newValue
        }
    }

    public var chinese: A {
        get {
            dictionary[.chinese] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.chinese] = newValue
        }
    }

    public var chuvash: A {
        get {
            dictionary[.chuvash] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.chuvash] = newValue
        }
    }

    public var cornish: A {
        get {
            dictionary[.cornish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.cornish] = newValue
        }
    }

    public var corsican: A {
        get {
            dictionary[.corsican] ?? dictionary[.french] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.corsican] = newValue
        }
    }

    public var cree: A {
        get {
            dictionary[.cree] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.cree] = newValue
        }
    }

    public var croatian: A {
        get {
            dictionary[.croatian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.croatian] = newValue
        }
    }

    public var czech: A {
        get {
            dictionary[.czech] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.czech] = newValue
        }
    }

    public var danish: A {
        get {
            dictionary[.danish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.danish] = newValue
        }
    }

    public var dutch: A {
        get {
            dictionary[.dutch] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.dutch] = newValue
        }
    }

    public var dzongkha: A {
        get {
            dictionary[.dzongkha] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.dzongkha] = newValue
        }
    }

    public var english: A {
        get {
            dictionary[.english] ?? `default`
        }
        set {
            dictionary[.english] = newValue
        }
    }

    public var esperanto: A {
        get {
            dictionary[.esperanto] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.esperanto] = newValue
        }
    }

    public var estonian: A {
        get {
            dictionary[.estonian] ?? dictionary[.russian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.estonian] = newValue
        }
    }

    public var ewe: A {
        get {
            dictionary[.ewe] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.ewe] = newValue
        }
    }
    public var faroese: A {
        get {
            dictionary[.faroese] ?? dictionary[.danish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.faroese] = newValue
        }
    }

    public var fijian: A {
        get {
            dictionary[.fijian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.fijian] = newValue
        }
    }

    public var finnish: A {
        get {
            dictionary[.finnish] ?? dictionary[.swedish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.finnish] = newValue
        }
    }

    public var french: A {
        get {
            dictionary[.french] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.french] = newValue
        }
    }

    public var galician: A {
        get {
            dictionary[.galician] ?? dictionary[.spanish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.galician] = newValue
        }
    }

    public var gaelicScottish: A {
        get {
            dictionary[.gaelicScottish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.gaelicScottish] = newValue
        }
    }

    public var georgian: A {
        get {
            dictionary[.georgian] ?? dictionary[.russian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.georgian] = newValue
        }
    }

    public var german: A {
        get {
            dictionary[.german] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.german] = newValue
        }
    }

    public var greek: A {
        get {
            dictionary[.greek] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.greek] = newValue
        }
    }

    public var guarani: A {
        get {
            dictionary[.guarani] ?? dictionary[.spanish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.guarani] = newValue
        }
    }

    public var gujarati: A {
        get {
            dictionary[.gujarati] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.gujarati] = newValue
        }
    }

    public var haitianCreole: A {
        get {
            dictionary[.haitianCreole] ?? dictionary[.french] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.haitianCreole] = newValue
        }
    }

    public var hausa: A {
        get {
            dictionary[.hausa] ?? dictionary[.french] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.hausa] = newValue
        }
    }

    public var hebrew: A {
        get {
            dictionary[.hebrew] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.hebrew] = newValue
        }
    }

    public var herero: A {
        get {
            dictionary[.herero] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.herero] = newValue
        }
    }

    public var hindi: A {
        get {
            dictionary[.hindi] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.hindi] = newValue
        }
    }

    public var hiriMotu: A {
        get {
            dictionary[.hiriMotu] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.hiriMotu] = newValue
        }
    }

    public var hungarian: A {
        get {
            dictionary[.hungarian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.hungarian] = newValue
        }
    }

    public var icelandic: A {
        get {
            dictionary[.icelandic] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.icelandic] = newValue
        }
    }

    public var ido: A {
        get {
            dictionary[.ido] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.ido] = newValue
        }
    }

    public var igbo: A {
        get {
            dictionary[.igbo] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.igbo] = newValue
        }
    }

    public var indonesian: A {
        get {
            dictionary[.indonesian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.indonesian] = newValue
        }
    }

    public var interlingua: A {
        get {
            dictionary[.interlingua] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.interlingua] = newValue
        }
    }

    public var interlingue: A {
        get {
            dictionary[.interlingue] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.interlingue] = newValue
        }
    }

    public var inuktitut: A {
        get {
            dictionary[.inuktitut] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.inuktitut] = newValue
        }
    }

    public var inupiak: A {
        get {
            dictionary[.inupiak] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.inupiak] = newValue
        }
    }

    public var irish: A {
        get {
            dictionary[.irish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.irish] = newValue
        }
    }

    public var italian: A {
        get {
            dictionary[.italian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.italian] = newValue
        }
    }

    public var japanese: A {
        get {
            dictionary[.japanese] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.japanese] = newValue
        }
    }

    public var javanese: A {
        get {
            dictionary[.javanese] ?? dictionary[.indonesian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.javanese] = newValue
        }
    }

    public var kannada: A {
        get {
            dictionary[.kannada] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.kannada] = newValue
        }
    }

    public var kanuri: A {
        get {
            dictionary[.kanuri] ?? dictionary[.french] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.kanuri] = newValue
        }
    }

    public var kashmiri: A {
        get {
            dictionary[.kashmiri] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.kashmiri] = newValue
        }
    }

    public var kazakh: A {
        get {
            dictionary[.kazakh] ?? dictionary[.russian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.kazakh] = newValue
        }
    }

    public var khmer: A {
        get {
            dictionary[.khmer] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.khmer] = newValue
        }
    }

    public var kikuyu: A {
        get {
            dictionary[.kikuyu] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.kikuyu] = newValue
        }
    }

    public var kinyarwanda: A {
        get {
            dictionary[.kinyarwanda] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.kinyarwanda] = newValue
        }
    }

    public var kirundi: A {
        get {
            dictionary[.kirundi] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.kirundi] = newValue
        }
    }

    public var korean: A {
        get {
            dictionary[.korean] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.korean] = newValue
        }
    }

    public var komi: A {
        get {
            dictionary[.komi] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.komi] = newValue
        }
    }

    public var kongo: A {
        get {
            dictionary[.kongo] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.kongo] = newValue
        }
    }
    public var kurdish: A {
        get {
            dictionary[.kurdish] ?? dictionary[.arabic] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.kurdish] = newValue
        }
    }

    public var kwanyama: A {
        get {
            dictionary[.kwanyama] ?? dictionary[.portuguese] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.kwanyama] = newValue
        }
    }

    public var kyrgyz: A {
        get {
            dictionary[.kyrgyz] ?? dictionary[.russian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.kyrgyz] = newValue
        }
    }

    public var lao: A {
        get {
            dictionary[.lao] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.lao] = newValue
        }
    }

    public var latin: A {
        get {
            dictionary[.latin] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.latin] = newValue
        }
    }

    public var latvian: A {
        get {
            dictionary[.latvian] ?? dictionary[.russian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.latvian] = newValue
        }
    }

    public var limburgish: A {
        get {
            dictionary[.limburgish] ?? dictionary[.dutch] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.limburgish] = newValue
        }
    }

    public var lingala: A {
        get {
            dictionary[.lingala] ?? dictionary[.french] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.lingala] = newValue
        }
    }

    public var lithuanian: A {
        get {
            dictionary[.lithuanian] ?? dictionary[.russian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.lithuanian] = newValue
        }
    }

    public var lugaKatanga: A {
        get {
            dictionary[.lugaKatanga] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.lugaKatanga] = newValue
        }
    }

    public var luxembourgish: A {
        get {
            dictionary[.luxembourgish] ?? dictionary[.french] ?? dictionary[.german] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.luxembourgish] = newValue
        }
    }

    public var macedonian: A {
        get {
            dictionary[.macedonian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.macedonian] = newValue
        }
    }

    public var malagasy: A {
        get {
            dictionary[.malagasy] ?? dictionary[.french] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.malagasy] = newValue
        }
    }

    public var malay: A {
        get {
            dictionary[.malay] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.malay] = newValue
        }
    }

    public var malayalam: A {
        get {
            dictionary[.malayalam] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.malayalam] = newValue
        }
    }

    public var maltese: A {
        get {
            dictionary[.maltese] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.maltese] = newValue
        }
    }

    public var manx: A {
        get {
            dictionary[.manx] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.manx] = newValue
        }
    }

    public var maori: A {
        get {
            dictionary[.maori] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.maori] = newValue
        }
    }

    public var marathi: A {
        get {
            dictionary[.marathi] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.marathi] = newValue
        }
    }

    public var marshallese: A {
        get {
            dictionary[.marshallese] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.marshallese] = newValue
        }
    }

    public var moldavian: A {
        get {
            dictionary[.moldavian] ?? dictionary[.russian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.moldavian] = newValue
        }
    }

    public var mongolian: A {
        get {
            dictionary[.mongolian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.mongolian] = newValue
        }
    }

    public var nauru: A {
        get {
            dictionary[.nauru] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.nauru] = newValue
        }
    }

    public var navajo: A {
        get {
            dictionary[.navajo] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.navajo] = newValue
        }
    }

    public var ndonga: A {
        get {
            dictionary[.ndonga] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.ndonga] = newValue
        }
    }

    public var nepali: A {
        get {
            dictionary[.nepali] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.nepali] = newValue
        }
    }

    public var northernNdebele: A {
        get {
            dictionary[.northernNdebele] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.northernNdebele] = newValue
        }
    }

    public var norwegian: A {
        get {
            dictionary[.norwegian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.norwegian] = newValue
        }
    }

    public var norwegianBokmål: A {
        get {
            dictionary[.norwegianBokmål] ?? dictionary[.norwegian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.norwegianBokmål] = newValue
        }
    }

    public var norwegianNynorsk: A {
        get {
            dictionary[.norwegianNynorsk] ?? dictionary[.norwegian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.norwegianNynorsk] = newValue
        }
    }

    public var occitan: A {
        get {
            dictionary[.occitan] ?? dictionary[.spanish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.occitan] = newValue
        }
    }

    public var ojibwe: A {
        get {
            dictionary[.ojibwe] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.ojibwe] = newValue
        }
    }

    public var oriya: A {
        get {
            dictionary[.oriya] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.oriya] = newValue
        }
    }

    public var oromo: A {
        get {
            dictionary[.oromo] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.oromo] = newValue
        }
    }

    public var ossetian: A {
        get {
            dictionary[.ossetian] ?? dictionary[.russian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.ossetian] = newValue
        }
    }

    public var pāli: A {
        get {
            dictionary[.pāli] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.pāli] = newValue
        }
    }

    public var persian: A {
        get {
            dictionary[.persian] ?? dictionary[.arabic] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.persian] = newValue
        }
    }

    public var polish: A {
        get {
            dictionary[.polish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.polish] = newValue
        }
    }

    public var portuguese: A {
        get {
            dictionary[.portuguese] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.portuguese] = newValue
        }
    }

    public var punjabi: A {
        get {
            dictionary[.punjabi] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.punjabi] = newValue
        }
    }

    public var quechua: A {
        get {
            dictionary[.quechua] ?? dictionary[.spanish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.quechua] = newValue
        }
    }

    public var romanian: A {
        get {
            dictionary[.romanian] ?? dictionary[.russian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.romanian] = newValue
        }
    }

    public var romansh: A {
        get {
            dictionary[.romansh] ?? dictionary[.french] ?? dictionary[.italian] ?? dictionary[.german] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.romansh] = newValue
        }
    }

    public var russian: A {
        get {
            dictionary[.russian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.russian] = newValue
        }
    }

    public var sami: A {
        get {
            dictionary[.sami] ?? dictionary[.norwegian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.sami] = newValue
        }
    }

    public var samoan: A {
        get {
            dictionary[.samoan] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.samoan] = newValue
        }
    }

    public var sango: A {
        get {
            dictionary[.sango] ?? dictionary[.french] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.sango] = newValue
        }
    }

    public var sanskrit: A {
        get {
            dictionary[.sanskrit] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.sanskrit] = newValue
        }
    }

    public var serbian: A {
        get {
            dictionary[.serbian] ?? dictionary[.albanian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.serbian] = newValue
        }
    }

    public var serboCroatian: A {
        get {
            dictionary[.serboCroatian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.serboCroatian] = newValue
        }
    }

    public var sesotho: A {
        get {
            dictionary[.sesotho] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.sesotho] = newValue
        }
    }

    public var setswana: A {
        get {
            dictionary[.setswana] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.setswana] = newValue
        }
    }

    public var shona: A {
        get {
            dictionary[.shona] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.shona] = newValue
        }
    }

    public var sindhi: A {
        get {
            dictionary[.sindhi] ?? dictionary[.urdu] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.sindhi] = newValue
        }
    }

    public var sinhalese: A {
        get {
            dictionary[.sinhalese] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.sinhalese] = newValue
        }
    }

    public var slovak: A {
        get {
            dictionary[.slovak] ?? dictionary[.german] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.slovak] = newValue
        }
    }

    public var slovenian: A {
        get {
            dictionary[.slovenian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.slovenian] = newValue
        }
    }

    public var somali: A {
        get {
            dictionary[.somali] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.somali] = newValue
        }
    }

    public var southernNdebele: A {
        get {
            dictionary[.southernNdebele] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.southernNdebele] = newValue
        }
    }

    public var spanish: A {
        get {
            dictionary[.spanish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.spanish] = newValue
        }
    }

    public var sundanese: A {
        get {
            dictionary[.sundanese] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.sundanese] = newValue
        }
    }

    public var swahili: A {
        get {
            dictionary[.swahili] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.swahili] = newValue
        }
    }

    public var swati: A {
        get {
            dictionary[.swati] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.swati] = newValue
        }
    }

    public var swedish: A {
        get {
            dictionary[.swedish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.swedish] = newValue
        }
    }

    public var tagalog: A {
        get {
            dictionary[.tagalog] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.tagalog] = newValue
        }
    }

    public var tahitian: A {
        get {
            dictionary[.tahitian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.tahitian] = newValue
        }
    }

    public var tajik: A {
        get {
            dictionary[.tajik] ?? dictionary[.russian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.tajik] = newValue
        }
    }

    public var tamil: A {
        get {
            dictionary[.tamil] ?? dictionary[.malay] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.tamil] = newValue
        }
    }

    public var tatar: A {
        get {
            dictionary[.tatar] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.tatar] = newValue
        }
    }

    public var telugu: A {
        get {
            dictionary[.telugu] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.telugu] = newValue
        }
    }

    public var thai: A {
        get {
            dictionary[.thai] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.thai] = newValue
        }
    }

    public var tibetan: A {
        get {
            dictionary[.tibetan] ?? dictionary[.chinese] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.tibetan] = newValue
        }
    }

    public var tigrinya: A {
        get {
            dictionary[.tigrinya] ?? dictionary[.arabic] ?? dictionary[.italian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.tigrinya] = newValue
        }
    }

    public var tonga: A {
        get {
            dictionary[.tonga] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.tonga] = newValue
        }
    }

    public var tsonga: A {
        get {
            dictionary[.tsonga] ?? dictionary[.afrikaans] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.tsonga] = newValue
        }
    }

    public var turkish: A {
        get {
            dictionary[.turkish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.turkish] = newValue
        }
    }

    public var turkmen: A {
        get {
            dictionary[.turkmen] ?? dictionary[.russian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.turkmen] = newValue
        }
    }

    public var twi: A {
        get {
            dictionary[.twi] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.twi] = newValue
        }
    }

    public var ukEnglish: A {
        get {
            dictionary[.ukEnglish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.ukEnglish] = newValue
        }
    }

    public var ukrainian: A {
        get {
            dictionary[.ukrainian] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.ukrainian] = newValue
        }
    }

    public var urdu: A {
        get {
            dictionary[.urdu] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.urdu] = newValue
        }
    }

    public var usEnglish: A {
        get {
            dictionary[.usEnglish] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.usEnglish] = newValue
        }
    }

    public var uyghur: A {
        get {
            dictionary[.uyghur] ?? dictionary[.chinese] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.uyghur] = newValue
        }
    }

    public var uzbek: A {
        get {
            dictionary[.uzbek] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.uzbek] = newValue
        }
    }

    public var venda: A {
        get {
            dictionary[.venda] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.venda] = newValue
        }
    }

    public var vietnamese: A {
        get {
            dictionary[.vietnamese] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.vietnamese] = newValue
        }
    }

    public var volapük: A {
        get {
            dictionary[.volapük] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.volapük] = newValue
        }
    }

    public var wallon: A {
        get {
            dictionary[.wallon] ?? dictionary[.french] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.wallon] = newValue
        }
    }

    public var welsh: A {
        get {
            dictionary[.welsh] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.welsh] = newValue
        }
    }

    public var westernFrisian: A {
        get {
            dictionary[.westernFrisian] ?? dictionary[.dutch] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.westernFrisian] = newValue
        }
    }

    public var wolof: A {
        get {
            dictionary[.wolof] ?? dictionary[.french] ?? dictionary[.arabic] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.wolof] = newValue
        }
    }

    public var xhosa: A {
        get {
            dictionary[.xhosa] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.xhosa] = newValue
        }
    }

    public var yoruba: A {
        get {
            dictionary[.yoruba] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.yoruba] = newValue
        }
    }

    public var zulu: A {
        get {
            dictionary[.zulu] ?? dictionary[.english] ?? `default`
        }
        set {
            dictionary[.zulu] = newValue
        }
    }
}

extension Translated: Codable where A: Codable {}
extension Translated: Sendable where A: Sendable {}
extension Translated: Equatable where A: Equatable {}
extension Translated: Hashable where A: Hashable {}

extension Translated<String> {
    public static func +(lhs: Translated<String>, rhs: Translated<String>) -> Translated<String> {
        let allKeys = Set(lhs.dictionary.keys).union(rhs.dictionary.keys)

        let newTranslations = Dictionary(uniqueKeysWithValues: allKeys.map { key in
            (key, (lhs.dictionary[key] ?? "") + (rhs.dictionary[key] ?? ""))
        })

        return Translated<String>(
            default: lhs.default + rhs.default,
            dictionary: newTranslations
        )
    }

    public static func +(lhs: Translated<String>, rhs: String) -> Translated<String> {
        let newTranslations = lhs.dictionary.mapValues { $0 + rhs }
        return Translated<String>(default: lhs.default, dictionary: newTranslations)
    }

    public static func +(lhs: String, rhs: Translated<String>) -> Translated<String> {
        let newTranslations = rhs.dictionary.mapValues { lhs + $0 }
        return Translated<String>(default: rhs.default, dictionary: newTranslations)
    }
}
