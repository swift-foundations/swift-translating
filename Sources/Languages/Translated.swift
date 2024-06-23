//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 13/12/2020.
//

import Dependencies
import Foundation



public struct Translated<A> {
    public let dutch: A
    public let english: A
    public let arabic: A
    public let bengali: A
    public let chinese: A
    public let danish: A
    public let french: A
    public let german: A
    public let hindi: A
//    public let irish:A
    public let italian: A
    public let japanese: A
    public let javanese: A
    public let korean: A
    public let polish: A
    public let portuguese: A
    public let romanian: A
    public let russian: A
    public let slovak: A
    public let slovenian: A
    public let spanish: A
    public let swedish: A
    public let turkish: A
//    public let abkhazian:A
//    public let afar:A
//    public let afrikaans:A
//    public let akan:A
//    public let albanian:A
//    public let amharic:A
//    public let aragonese:A
//    public let armenian:A
//    public let assamese:A
//    public let auEnglish:A
//    public let avaric:A
//    public let avestan:A
//    public let aymara:A
//    public let azerbaijani:A
//    public let bambara:A
//    public let bashkir:A
//    public let basque:A
//    public let belarusian:A
//    public let bihari:A
//    public let bislama:A
//    public let bosnian:A
//    public let breton:A
//    public let bulgarian:A
//    public let burmese:A
//    public let catalan:A
//    public let caEnglish:A
//    public let chamorro:A
//    public let chechen:A
//
//    public let chuvash:A
//    public let cornish:A
//    public let corsican:A
//    public let cree:A
//    public let croatian:A
//    public let czech:A
//
//    public let dzongkha:A
//
//    public let esperanto:A
//    public let estonian:A
//    public let ewe:A
//    public let faroese:A
//    public let fijian:A
//    public let finnish:A
//
//    public let galician:A
//    public let gaelicScottish:A
//    public let georgian:A
//
//    public let greek:A
//    public let guarani:A
//    public let gujarati:A
//    public let haitianCreole:A
//    public let hausa:A
//    public let hebrew:A
//    public let herero:A
//
//    public let hiriMotu:A
//    public let hungarian:A
//    public let icelandic:A
//    public let ido:A
//    public let igbo:A
    public let indonesian: A
//    public let interlingua:A
//    public let interlingue:A
//    public let inuktitut:A
//    public let inupiak:A
//
//    public let kannada:A
//    public let kanuri:A
//    public let kashmiri:A
//    public let kazakh:A
//    public let khmer:A
//    public let kikuyu:A
//    public let kinyarwanda:A
//    public let kirundi:A
//    public let kyrgyz:A
//    public let komi:A
//    public let kongo:A
//
//    public let kurdish:A
//    public let kwanyama:A
//    public let lao:A
//    public let latin:A
//    public let latvian:A
//    public let limburgish:A
//    public let lingala:A
//    public let lithuanian:A
//    public let lugaKatanga:A
//    public let luxembourgish:A
//    public let manx:A
//    public let macedonian:A
//    public let malagasy:A
//    public let malay:A
//    public let malayalam:A
//    public let maltese:A
//    public let maori:A
//    public let marathi:A
//    public let marshallese:A
//    public let moldavian:A
//    public let mongolian:A
//    public let nauru:A
//    public let navajo:A
//    public let ndonga:A
//    public let northernNdebele:A
//    public let nepali:A
//    public let norwegian:A
//    public let norwegianBokmål:A
//    public let norwegianNynorsk:A
//    public let occitan:A
//    public let ojibwe:A
//    public let oriya:A
//    public let oromo:A
//    public let ossetian:A
//    public let pāli:A
//    public let persian:A
//
//    public let punjabi:A
//    public let quechua:A
//    public let romansh:A
//
//    public let sami:A
//    public let samoan:A
//    public let sango:A
//    public let sanskrit:A
//    public let serbian:A
//    public let serboCroatian:A
//    public let sesotho:A
//    public let setswana:A
//    public let shona:A
//    public let sindhi:A
//    public let sinhalese:A
//
//    public let somali:A
//    public let southernNdebele:A
//
//    public let sundanese:A
//    public let swahili:A
//    public let swati:A
//
//    public let tagalog:A
//    public let tahitian:A
//    public let tajik:A
//    public let tamil:A
//    public let tatar:A
//    public let telugu:A
//    public let thai:A
//    public let tibetan:A
//    public let tigrinya:A
//    public let tonga:A
//    public let tsonga:A
//
//    public let turkmen:A
//    public let twi:A
//    public let uyghur:A
//    public let ukEnglish:A
//    public let ukrainian:A
//    public let urdu:A
//    public let usEnglish:A
//    public let uzbek:A
//    public let venda:A
//    public let vietnamese:A
//    public let volapük:A
//    public let wallon:A
//    public let welsh:A
//    public let wolof:A
//    public let westernFrisian:A
//    public let xhosa:A
//    public let yoruba:A
//    public let zulu:A
//

    public var engels: A { english }
    public var nederlands: A { dutch }
    public var nl: A { dutch }

//    func all()->[A] {
//        [
////            abkhazian,
////            afar,
////            afrikaans,
////            akan,
////            albanian,
////            amharic,
//            arabic,
////            aragonese,
////            armenian,
////            assamese,
////            auEnglish,
////            avaric,
////            avestan,
////            aymara,
////            azerbaijani,
////            bambara,
////            bashkir,
////            basque,
////            belarusian,
//            bengali,
////            bihari,
////            bislama,
////            bosnian,
////            breton,
////            bulgarian,
////            burmese,
////            catalan,
////            caEnglish,
////            chamorro,
////            chechen,
//            chinese,
////            chuvash,
////            cornish,
////            corsican,
////            cree,
////            croatian,
////            czech,
//            danish,
//            dutch,
////            dzongkha,
//            english,
////            esperanto,
////            estonian,
////            ewe,
////            faroese,
////            fijian,
////            finnish,
//            french,
////            galician,
////            gaelicScottish,
////            georgian,
////            german,
////            greek,
////            guarani,
////            gujarati,
////            haitianCreole,
////            hausa,
////            hebrew,
////            herero,
//            hindi,
////            hiriMotu,
////            hungarian,
////            icelandic,
////            ido,
////            igbo,
////            indonesian,
////            interlingua,
////            interlingue,
////            inuktitut,
////            inupiak,
//            irish,
//            italian,
//            japanese,
//            javanese,
////            kannada,
////            kanuri,
////            kashmiri,
////            kazakh,
////            khmer,
////            kikuyu,
////            kinyarwanda,
////            kirundi,
////            kyrgyz,
////            komi,
////            kongo,
//            korean,
////            kurdish,
////            kwanyama,
////            lao,
////            latin,
////            latvian,
////            limburgish,
////            lingala,
////            lithuanian,
////            lugaKatanga,
////            luxembourgish,
////            manx,
////            macedonian,
////            malagasy,
////            malay,
////            malayalam,
////            maltese,
////            maori,
////            marathi,
////            marshallese,
////            moldavian,
////            mongolian,
////            nauru,
////            navajo,
////            ndonga,
////            northernNdebele,
////            nepali,
////            norwegian,
////            norwegianBokmål,
////            norwegianNynorsk,
////            occitan,
////            ojibwe,
////            oriya,
////            oromo,
////            ossetian,
////            pāli,
////            persian,
//            polish,
//            portuguese,
////            punjabi,
////            quechua,
////            romansh,
//            romanian,
//            russian,
////            sami,
////            samoan,
////            sango,
////            sanskrit,
////            serbian,
////            serboCroatian,
////            sesotho,
////            setswana,
////            shona,
////            sindhi,
////            sinhalese,
//            slovak,
//            slovenian,
////            somali,
////            southernNdebele,
//            spanish,
////            sundanese,
////            swahili,
////            swati,
////            swedish,
////            tagalog,
////            tahitian,
////            tajik,
////            tamil,
////            tatar,
////            telugu,
////            thai,
////            tibetan,
////            tigrinya,
////            tonga,
////            tsonga,
////            turkish,
////            turkmen,
////            twi,
////            uyghur,
////            ukEnglish,
////            ukrainian,
////            urdu,
////            usEnglish,
////            uzbek,
////            venda,
////            vietnamese,
////            volapük,
////            wallon,
////            welsh,
////            wolof,
////            westernFrisian,
////            xhosa,
////            yoruba,
////            zulu
//        ]
//    }

    public func callAsFunction(with language: Languages.Language) -> A {
        callAsFunction(language: language)
    }

    public func callAsFunction(in language: Languages.Language) -> A {
        callAsFunction(language: language)
    }

    public func callAsFunction(for language: Languages.Language) -> A {
        callAsFunction(language: language)
    }

    public func test() -> A {
        fatalError()
    }

    public func callAsFunction(language: Languages.Language) -> A {
        switch language {
        case .dutch: return dutch
        case .english: return english
        case .arabic: return arabic
        case .chinese: return chinese
        case .danish: return danish
        case .french: return french
        case .german: return german
        case .italian: return italian
//        case .japanese: return japanese
//        case .korean: return korean
//        case .portuguese: return portuguese
//        case .russian: return russian
        case .spanish: return spanish
//        case .swedish: return swedish
//        case .turkish: return turkish
//        case .bengali: return bengali
//        case .hindi: return hindi
//        case .irish: return irish
//        case .javanese: return javanese
//        case .polish: return polish
//        case .romanian: return romanian
//        case .slovak: return slovak
//        case .slovenian: return slovenian
        default: return english

//        case .abkhazian: return abkhazian
//        case .afar: return afar
//        case .afrikaans: return afrikaans
//        case .akan: return akan
//        case .albanian: return albanian
//        case .amharic: return amharic
//        case .aragonese: return aragonese
//        case .armenian: return armenian
//        case .assamese: return assamese
//        case .auEnglish: return auEnglish
//        case .avaric: return avaric
//        case .avestan: return avestan
//        case .aymara: return aymara
//        case .azerbaijani: return azerbaijani
//        case .bambara: return bambara
//        case .bashkir: return bashkir
//        case .basque: return basque
//        case .belarusian: return belarusian
//        case .bihari: return bihari
//        case .bislama: return bislama
//        case .bosnian: return bosnian
//        case .breton: return breton
//        case .bulgarian: return bulgarian
//        case .burmese: return burmese
//        case .catalan: return catalan
//        case .caEnglish: return caEnglish
//        case .chamorro: return chamorro
//        case .chechen: return chechen
//        case .chuvash: return chuvash
//        case .cornish: return cornish
//        case .corsican: return corsican
//        case .cree: return cree
//        case .croatian: return croatian
//        case .czech: return czech
//        case .dzongkha: return dzongkha
//        case .esperanto: return esperanto
//        case .estonian: return estonian
//        case .ewe: return ewe
//        case .faroese: return faroese
//        case .fijian: return fijian
//        case .finnish: return finnish
//        case .galician: return galician
//        case .gaelicScottish: return gaelicScottish
//        case .georgian: return georgian
//        case .greek: return greek
//        case .guarani: return guarani
//        case .gujarati: return gujarati
//        case .haitianCreole: return haitianCreole
//        case .hausa: return hausa
//        case .hebrew: return hebrew
//        case .herero: return herero
//
//        case .hiriMotu: return hiriMotu
//        case .hungarian: return hungarian
//        case .icelandic: return icelandic
//        case .ido: return ido
//        case .igbo: return igbo
//        case .indonesian: return indonesian
//        case .interlingua: return interlingua
//        case .interlingue: return interlingue
//        case .inuktitut: return inuktitut
//        case .inupiak: return inupiak
//
//        case .kannada: return kannada
//        case .kanuri: return kanuri
//        case .kashmiri: return kashmiri
//        case .kazakh: return kazakh
//        case .khmer: return khmer
//        case .kikuyu: return kikuyu
//        case .kinyarwanda: return kinyarwanda
//        case .kirundi: return kirundi
//        case .kyrgyz: return kyrgyz
//        case .komi: return komi
//        case .kongo: return kongo
//        case .kurdish: return kurdish
//        case .kwanyama: return kwanyama
//        case .lao: return lao
//        case .latin: return latin
//        case .latvian: return latvian
//        case .limburgish: return limburgish
//        case .lingala: return lingala
//        case .lithuanian: return lithuanian
//        case .lugaKatanga: return lugaKatanga
//        case .luxembourgish: return luxembourgish
//        case .manx: return manx
//        case .macedonian: return macedonian
//        case .malagasy: return malagasy
//        case .malay: return malay
//        case .malayalam: return malayalam
//        case .maltese: return maltese
//        case .maori: return maori
//        case .marathi: return marathi
//        case .marshallese: return marshallese
//        case .moldavian: return moldavian
//        case .mongolian: return mongolian
//        case .nauru: return nauru
//        case .navajo: return navajo
//        case .ndonga: return ndonga
//        case .northernNdebele: return northernNdebele
//        case .nepali: return nepali
//        case .norwegian: return norwegian
//        case .norwegianBokmål: return norwegianBokmål
//        case .norwegianNynorsk: return norwegianNynorsk
//        case .occitan: return occitan
//        case .ojibwe: return ojibwe
//        case .oriya: return oriya
//        case .oromo: return oromo
//        case .ossetian: return ossetian
//        case .pāli: return pāli
//        case .persian: return persian
//
//        case .punjabi: return punjabi
//        case .quechua: return quechua
//        case .romansh: return romansh
//
//        case .sami: return sami
//        case .samoan: return samoan
//        case .sango: return sango
//        case .sanskrit: return sanskrit
//        case .serbian: return serbian
//        case .serboCroatian: return serboCroatian
//        case .sesotho: return sesotho
//        case .setswana: return setswana
//        case .shona: return shona
//        case .sindhi: return sindhi
//        case .sinhalese: return sinhalese
//
//        case .somali: return somali
//        case .southernNdebele: return southernNdebele
//        case .sundanese: return sundanese
//        case .swahili: return swahili
//        case .swati: return swati
//        case .tagalog: return tagalog
//        case .tahitian: return tahitian
//        case .tajik: return tajik
//        case .tamil: return tamil
//        case .tatar: return tatar
//        case .telugu: return telugu
//        case .thai: return thai
//        case .tibetan: return tibetan
//        case .tigrinya: return tigrinya
//        case .tonga: return tonga
//        case .tsonga: return tsonga
//        case .turkmen: return turkmen
//        case .twi: return twi
//        case .uyghur: return uyghur
//        case .ukEnglish: return ukEnglish
//        case .ukrainian: return ukrainian
//        case .urdu: return urdu
//        case .usEnglish: return usEnglish
//        case .uzbek: return uzbek
//        case .venda: return venda
//        case .vietnamese: return vietnamese
//        case .volapük: return volapük
//        case .wallon: return wallon
//        case .welsh: return welsh
//        case .wolof: return wolof
//        case .westernFrisian: return westernFrisian
//        case .xhosa: return xhosa
//        case .yoruba: return yoruba
//        case .zulu: return zulu
        }
    }

    public func callAsFunction(_ language: Languages.Language) -> A {
        callAsFunction(language: language)
    }

    public init(
        _ all: A
    ) {
        self.init(english: all)
    }

    public init(
        _ all: (Languages.Language) -> A
    ) {

        self.dutch = all(.dutch)
        self.english = all(.english)
        self.arabic = all(.arabic)
        self.bengali = all(.bengali)
        self.chinese = all(.chinese)
        self.danish = all(.danish)
        self.french = all(.french)
        self.german = all(.german)
        self.hindi = all(.hindi)
//        self.irish = all(.irish)
        self.indonesian = all(.indonesian)
        self.italian = all(.italian)
        self.japanese = all(.japanese)
        self.javanese = all(.javanese)
        self.korean = all(.korean)
        self.polish = all(.polish)
        self.portuguese = all(.portuguese)
        self.romanian = all(.romanian)
        self.russian = all(.russian)
        self.spanish = all(.spanish)
        self.slovak = all(.slovak)
        self.slovenian = all(.slovenian)
        self.swedish = all(.swedish)
        self.turkish = all(.turkish)

//        self.abkhazian = all(.abkhazian)
//        self.afar = all(.afar)
//        self.afrikaans = all(.afrikaans)
//        self.akan = all(.akan)
//        self.albanian = all(.albanian)
//        self.amharic = all(.amharic)
//
//        self.aragonese = all(.aragonese)
//        self.armenian = all(.armenian)
//        self.assamese = all(.assamese)
//        self.auEnglish = all(.auEnglish)
//        self.avaric = all(.avaric)
//        self.avestan = all(.avestan)
//        self.aymara = all(.aymara)
//        self.azerbaijani = all(.azerbaijani)
//        self.bambara = all(.bambara)
//        self.bashkir = all(.bashkir)
//        self.basque = all(.basque)
//        self.belarusian = all(.belarusian)
//
//        self.bihari = all(.bihari)
//        self.bislama = all(.bislama)
//        self.bosnian = all(.bosnian)
//        self.breton = all(.breton)
//        self.bulgarian = all(.bulgarian)
//        self.burmese = all(.burmese)
//        self.catalan = all(.catalan)
//        self.caEnglish = all(.caEnglish)
//        self.chamorro = all(.chamorro)
//        self.chechen = all(.chechen)
//        self.chuvash = all(.chuvash)
//        self.cornish = all(.cornish)
//        self.corsican = all(.corsican)
//        self.cree = all(.cree)
//        self.croatian = all(.croatian)
//        self.czech = all(.czech)
//
//
//        self.dzongkha = all(.dzongkha)
//
//        self.esperanto = all(.esperanto)
//        self.estonian = all(.estonian)
//        self.ewe = all(.ewe)
//        self.faroese = all(.faroese)
//        self.fijian = all(.fijian)
//        self.finnish = all(.finnish)
//        self.galician = all(.galician)
//        self.gaelicScottish = all(.gaelicScottish)
//        self.georgian = all(.georgian)
//        self.greek = all(.greek)
//        self.guarani = all(.guarani)
//        self.gujarati = all(.gujarati)
//        self.haitianCreole = all(.haitianCreole)
//        self.hausa = all(.hausa)
//        self.hebrew = all(.hebrew)
//        self.herero = all(.herero)
//
//        self.hiriMotu = all(.hiriMotu)
//        self.hungarian = all(.hungarian)
//        self.icelandic = all(.icelandic)
//        self.ido = all(.ido)
//        self.igbo = all(.igbo)
//        self.indonesian = all(.indonesian)
//        self.interlingua = all(.interlingua)
//        self.interlingue = all(.interlingue)
//        self.inuktitut = all(.inuktitut)
//        self.inupiak = all(.inupiak)
//
//
//        self.kannada = all(.kannada)
//        self.kanuri = all(.kanuri)
//        self.kashmiri = all(.kashmiri)
//        self.kazakh = all(.kazakh)
//        self.khmer = all(.khmer)
//        self.kikuyu = all(.kikuyu)
//        self.kinyarwanda = all(.kinyarwanda)
//        self.kirundi = all(.kirundi)
//        self.kyrgyz = all(.kyrgyz)
//        self.komi = all(.komi)
//        self.kongo = all(.kongo)
//
//        self.kurdish = all(.kurdish)
//        self.kwanyama = all(.kwanyama)
//        self.lao = all(.lao)
//        self.latin = all(.latin)
//        self.latvian = all(.latvian)
//        self.limburgish = all(.limburgish)
//        self.lingala = all(.lingala)
//        self.lithuanian = all(.lithuanian)
//        self.lugaKatanga = all(.lugaKatanga)
//        self.luxembourgish = all(.luxembourgish)
//        self.manx = all(.manx)
//        self.macedonian = all(.macedonian)
//        self.malagasy = all(.malagasy)
//        self.malay = all(.malay)
//        self.malayalam = all(.malayalam)
//        self.maltese = all(.maltese)
//        self.maori = all(.maori)
//        self.marathi = all(.marathi)
//        self.marshallese = all(.marshallese)
//        self.moldavian = all(.moldavian)
//        self.mongolian = all(.mongolian)
//        self.nauru = all(.nauru)
//        self.navajo = all(.navajo)
//        self.ndonga = all(.ndonga)
//        self.northernNdebele = all(.northernNdebele)
//        self.nepali = all(.nepali)
//        self.norwegian = all(.norwegian)
//        self.norwegianBokmål = all(.norwegianBokmål)
//        self.norwegianNynorsk = all(.norwegianNynorsk)
//        self.occitan = all(.occitan)
//        self.ojibwe = all(.ojibwe)
//        self.oriya = all(.oriya)
//        self.oromo = all(.oromo)
//        self.ossetian = all(.ossetian)
//        self.pāli = all(.pāli)
//        self.persian = all(.persian)
//
//        self.punjabi = all(.punjabi)
//        self.quechua = all(.quechua)
//        self.romansh = all(.romansh)
//
//        self.sami = all(.sami)
//        self.samoan = all(.samoan)
//        self.sango = all(.sango)
//        self.sanskrit = all(.sanskrit)
//        self.serbian = all(.serbian)
//        self.serboCroatian = all(.serboCroatian)
//        self.sesotho = all(.sesotho)
//        self.setswana = all(.setswana)
//        self.shona = all(.shona)
//        self.sindhi = all(.sindhi)
//        self.sinhalese = all(.sinhalese)
//
//
//        self.somali = all(.somali)
//        self.southernNdebele = all(.southernNdebele)
//
//        self.sundanese = all(.sundanese)
//        self.swahili = all(.swahili)
//        self.swati = all(.swati)
//
//        self.tagalog = all(.tagalog)
//        self.tahitian = all(.tahitian)
//        self.tajik = all(.tajik)
//        self.tamil = all(.tamil)
//        self.tatar = all(.tatar)
//        self.telugu = all(.telugu)
//        self.thai = all(.thai)
//        self.tibetan = all(.tibetan)
//        self.tigrinya = all(.tigrinya)
//        self.tonga = all(.tonga)
//        self.tsonga = all(.tsonga)
//
//        self.turkmen = all(.turkmen)
//        self.twi = all(.twi)
//        self.uyghur = all(.uyghur)
//        self.ukEnglish = all(.ukEnglish)
//        self.ukrainian = all(.ukrainian)
//        self.urdu = all(.urdu)
//        self.usEnglish = all(.usEnglish)
//        self.uzbek = all(.uzbek)
//        self.venda = all(.venda)
//        self.vietnamese = all(.vietnamese)
//        self.volapük = all(.volapük)
//        self.wallon = all(.wallon)
//        self.welsh = all(.welsh)
//        self.wolof = all(.wolof)
//        self.westernFrisian = all(.westernFrisian)
//        self.xhosa = all(.xhosa)
//        self.yoruba = all(.yoruba)
//        self.zulu = all(.zulu)
    }

    public func map<B>(_ transform: (A) -> B) -> Translated<B> {
//        return Translated<B>.init(
//            dutch: transform(self.dutch),
//            english: transform(english)
//        )

        return Translated<B>(
            arabic: transform(self.arabic),
            bengali: transform(self.bengali),
            chinese: transform(self.chinese),
            danish: transform(self.danish),
            dutch: transform(self.dutch),
            english: transform(self.english),
            french: transform(self.french),
            german: transform(self.german),
            hindi: transform(self.hindi),
            indonesian: transform(self.indonesian),
//            irish: transform(self.irish),
            italian: transform(self.italian),
            japanese: transform(self.japanese),
            javanese: transform(self.javanese),
            korean: transform(self.korean),
            polish: transform(self.polish),
            portuguese: transform(self.portuguese),
            romanian: transform(self.romanian),
            russian: transform(self.russian),
            slovak: transform(self.slovak),
            slovenian: transform(self.slovenian),
            spanish: transform(self.spanish),
            swedish: transform(self.swedish),
            turkish: transform(self.turkish)
        )
    }

    public func flatMap<B>(_ transform: (A) -> Translated<B>) -> Translated<B> {
//        return .init(
//            dutch: transform(dutch).dutch,
//            english: transform(english).english
//        )

        return .init(
            arabic: transform(arabic).arabic,
            bengali: transform(bengali).bengali,
            chinese: transform(chinese).chinese,
            danish: transform(danish).danish,
            dutch: transform(dutch).dutch,
            english: transform(english).english,
            french: transform(french).french,
            german: transform(german).german,
            hindi: transform(hindi).hindi,
            indonesian: transform(indonesian).indonesian,
//            irish: transform(irish).irish,
            italian: transform(italian).italian,
            japanese: transform(japanese).japanese,
            javanese: transform(javanese).javanese,
            korean: transform(korean).korean,
            polish: transform(polish).polish,
            portuguese: transform(portuguese).portuguese,
            romanian: transform(romanian).romanian,
            russian: transform(russian).russian,
            slovak: transform(slovak).slovak,
            slovenian: transform(slovenian).slovenian,
            spanish: transform(spanish).spanish,
            swedish: transform(swedish).swedish,
            turkish: transform(turkish).turkish
        )
    }
}

public extension Translated {
    init(
        arabic: A? = nil,
        bengali: A? = nil,
        chinese: A? = nil,
        danish: A? = nil,
        dutch: A? = nil,
        english: A,
        french: A? = nil,
        german: A? = nil,
        greenlandic: A? = nil,
        hindi: A? = nil,
        indonesian: A? = nil,
        irish: A? = nil,
        italian: A? = nil,
        japanese: A? = nil,
        javanese: A? = nil,
        korean: A? = nil,
        polish: A? = nil,
        portuguese: A? = nil,
        romanian: A? = nil,
        russian: A? = nil,
        slovak: A? = nil,
        slovenian: A? = nil,
        spanish: A? = nil,
        swedish: A? = nil,
        turkish: A? = nil
    ) {
        self.english = english
        self.dutch = dutch ?? english
        self.arabic = arabic ?? english
        self.bengali = bengali ?? english
        self.chinese = chinese ?? english
        self.danish = danish ?? english
        self.french = french ?? english
        self.german = german ?? english
        self.hindi = hindi ?? english
        self.indonesian = indonesian ?? english
//        self.irish = irish ?? english
        self.italian = italian ?? english
        self.japanese = japanese ?? english
        self.javanese = javanese ?? indonesian ?? english
        self.korean = korean ?? english
        self.polish = polish ?? english
        self.portuguese = portuguese ?? english
        self.romanian = romanian ?? russian ?? english
        self.russian = russian ?? english
        self.slovak = slovak ?? german ?? english
        self.slovenian = slovenian ?? english
        self.spanish = spanish ?? english
        self.swedish = swedish ?? english
        self.turkish = turkish ?? english
//        self.abkhazian = abkhazian ?? russian ?? georgian ?? english
//        self.afar = afar ?? amharic ?? oromo ?? somali ?? tigrinya ?? english
//        self.afrikaans = afrikaans ?? dutch ?? english
//        self.akan = akan ?? english
//        self.albanian = albanian ?? italian ?? english
//        self.amharic = amharic ?? oromo ?? somali ?? tigrinya ?? english
//
//        self.aragonese = aragonese ?? spanish ?? english
//        self.armenian = armenian ?? english
//        self.assamese = assamese ?? english
//        self.auEnglish = auEnglish ?? english
//        self.avaric = avaric ?? english
//        self.avestan = avestan ?? english
//        self.aymara = aymara ?? spanish ?? english
//        self.azerbaijani = azerbaijani ?? english
//        self.bambara = bambara ?? english
//        self.bashkir = bashkir ?? english
//        self.basque = basque ?? spanish ?? french ?? english
//        self.belarusian = belarusian ?? russian ?? english
//
//        self.bihari = bihari ?? english
//        self.bislama = bislama ?? english
//        self.bosnian = bosnian ?? english
//        self.breton = breton ?? french ?? english
//        self.bulgarian = bulgarian ?? english
//        self.burmese = burmese ?? english
//        self.catalan = catalan ?? spanish ?? french ?? portuguese ?? english
//        self.caEnglish = caEnglish ?? english
//        self.chamorro = chamorro ?? english
//        self.chechen = chechen ?? english
//
//        self.chuvash = chuvash ?? english
//        self.cornish = cornish ?? english
//        self.corsican = corsican ?? french ?? english
//        self.cree = cree ?? english
//        self.croatian = croatian ?? english
//        self.czech = czech ?? english
//
//        self.dzongkha = dzongkha ?? english
//        self.esperanto = esperanto ?? english
//        self.estonian = estonian ?? russian ?? english
//        self.ewe = ewe ?? english
//        self.faroese = faroese ?? danish ?? english
//        self.fijian = fijian ?? english
//        self.finnish = finnish ?? swedish ?? english
//
//        self.galician = galician ?? spanish ?? english
//        self.gaelicScottish = gaelicScottish ?? english
//        self.georgian = georgian ?? russian ?? english
//
//        self.greek = greek ?? english
//        self.guarani = guarani ?? spanish ?? english
//        self.gujarati = gujarati ?? english
//        self.haitianCreole = haitianCreole ?? french ?? english
//        self.hausa = hausa ?? french ?? english
//        self.hebrew = hebrew ?? english
//        self.herero = herero ?? english
//
//        self.hiriMotu = hiriMotu ?? english
//        self.hungarian = hungarian ?? english
//        self.icelandic = icelandic ?? english
//        self.ido = ido ?? english
//        self.igbo = igbo ?? english
//        self.indonesian = indonesian ?? english
//        self.interlingua = interlingua ?? english
//        self.interlingue = interlingue ?? english
//        self.inuktitut = inuktitut ?? english
//        self.inupiak = inupiak ?? english
//
//
//
//
//        self.kannada = kannada ?? english
//        self.kanuri = kanuri ?? french ?? english
//        self.kashmiri = kashmiri ?? english
//        self.kazakh = kazakh ?? russian ?? english
//        self.khmer = khmer ?? english
//        self.kikuyu = kikuyu ?? english
//        self.kinyarwanda = kinyarwanda ?? english
//        self.kirundi = kirundi ?? english
//        self.kyrgyz = kyrgyz ?? russian ?? english
//        self.komi = komi ?? english
//        self.kongo = kongo ?? english
//
//        self.kurdish = kurdish ?? arabic ?? english
//        self.kwanyama = kwanyama ?? portuguese ?? english
//        self.lao = lao ?? english
//        self.latin = latin ?? english
//        self.latvian = latvian ?? russian ?? english
//        self.limburgish = limburgish ?? dutch ?? english
//        self.lingala = lingala ?? french ?? english
//        self.lithuanian = lithuanian ?? russian ?? english
//        self.lugaKatanga = lugaKatanga ?? english
//        self.luxembourgish = luxembourgish ?? french ?? german ?? english
//        self.manx = manx ?? english
//        self.macedonian = macedonian ?? english
//        self.malagasy = malagasy ?? french ?? english
//        self.malay = malay ?? english
//        self.malayalam = malayalam ?? english
//        self.maltese = maltese ?? english
//        self.maori = maori ?? english
//        self.marathi = marathi ?? english
//        self.marshallese = marshallese ?? english
//        self.moldavian = moldavian ?? russian ?? english
//        self.mongolian = mongolian ?? english
//        self.nauru = nauru ?? english
//        self.navajo = navajo ?? english
//        self.ndonga = ndonga ?? english
//        self.northernNdebele = northernNdebele ?? english
//        self.nepali = nepali ?? english
//        self.norwegian = norwegian ?? english
//        self.norwegianBokmål = norwegianBokmål ?? norwegian ?? english
//        self.norwegianNynorsk = norwegianNynorsk ?? norwegian ?? english
//        self.occitan = occitan ?? spanish ?? english
//        self.ojibwe = ojibwe ?? english
//        self.oriya = oriya ?? english
//        self.oromo = oromo ?? english
//        self.ossetian = ossetian ?? russian ?? english
//        self.pāli = pāli ?? english
//        self.persian = persian ?? arabic ?? english
//
//
//        self.punjabi = punjabi ?? english
//        self.quechua = quechua ?? spanish ?? english
//        self.romansh = romansh ?? french ?? italian ?? german ?? english
//
//
//        self.sami = sami ?? norwegian ?? english
//        self.samoan = samoan ?? english
//        self.sango = sango ?? french ?? english
//        self.sanskrit = sanskrit ?? english
//        self.serbian = serbian ?? albanian ?? english
//        self.serboCroatian = serboCroatian ?? english
//        self.sesotho = sesotho ?? english
//        self.setswana = setswana ?? english
//        self.shona = shona ?? english
//        self.sindhi = sindhi ?? urdu ?? english
//        self.sinhalese = sinhalese ?? english
//
//
//        self.somali = somali ?? english
//        self.southernNdebele = southernNdebele ?? english
//
//        self.sundanese = sundanese ?? english
//        self.swahili = swahili ?? english
//        self.swati = swati ?? english
//
//        self.tagalog = tagalog ?? english
//        self.tahitian = tahitian ?? english
//        self.tajik = tajik ?? russian ?? english
//        self.tamil = tamil ?? malay ?? english
//        self.tatar = tatar ?? english
//        self.telugu = telugu ?? english
//        self.thai = thai ?? english
//        self.tibetan = tibetan ?? chinese ?? english
//        self.tigrinya = tigrinya ?? arabic ?? italian ?? english
//        self.tonga = tonga ?? english
//        self.tsonga = tsonga ?? afrikaans ?? english
//
//        self.turkmen = turkmen ?? russian ?? english
//        self.twi = twi ?? english
//        self.uyghur = uyghur ?? chinese ?? english
//        self.ukEnglish = ukEnglish ?? english
//        self.ukrainian = ukrainian ?? english
//        self.urdu = urdu ?? english
//        self.usEnglish = usEnglish ?? english
//        self.uzbek = uzbek ?? english
//        self.venda = venda ?? english
//        self.vietnamese = vietnamese ?? english
//        self.volapük = volapük ?? english
//        self.wallon = wallon ?? french ?? english
//        self.welsh = welsh ?? english
//        self.wolof = wolof ?? french ?? arabic ?? english
//        self.westernFrisian = westernFrisian ?? dutch ?? english
//        self.xhosa = xhosa ?? english
//        self.yoruba = yoruba ?? english
//        self.zulu = zulu ?? english

    }
}



// public extension Translated where A == String {
//    func contains(_ string:String) -> Bool {
//        self.all().map{ $0.lowercased() }.map { $0.contains(string.lowercased()) }.contains(true)
////            || self.any
//    }
// }

// extension Translated:StringProtocol where A:StringProtocol {}

extension Translated: Codable where A: Codable {}
extension Translated: Sendable where A: Sendable {}
extension Translated: Equatable where A: Equatable {}
extension Translated: Hashable where A: Hashable {}
extension Translated: Comparable where A: Comparable {
    public static func < (lhs: Translated<A>, rhs: Translated<A>) -> Bool {
        lhs.dutch < rhs.dutch
    }
}

public extension Array {
    func translated<A>(to language: Languages.Language) -> [A] where Self == [Translated<A>] {
        self.map { $0(language) }
    }
}

public extension Translated {
    func translated(to language: Languages.Language) -> A {
        self(language)
    }
}

extension Translated where A == String {
    static func +(lhs: Self, rhs: String) -> Self {
        return Translated<String>(dutch: lhs(.dutch) + rhs, english: lhs(.english) + rhs)
    }

    static func +(lhs: String, rhs: Self) -> Self {
        return Translated<String>(dutch: lhs + rhs(.dutch), english: lhs + rhs(.english))
    }
}

public extension String {
    var any: Self {
        if let first = self.first {
            if Set<String>.consonents.contains(String(first)) {return "an \(self)"} else { return "a \(self)" }
        }
        return self
    }
}

public extension Translated where A == String {
    var any: Self {
        .init(

            dutch: "een \(dutch)",
            english: {
                if let first = english.first {
                    if Set<String>.consonents.contains(String(first)) {return "an \(english)"} else { return "a \(english)" }
                }
                return english
            }()
        )
    }

    var the: Self {
        .init(

            dutch: "de \(dutch)", english: "the \(english)"
        )
    }
}

extension Set where Element == String {
    static let consonents: Self = [
        "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"
    ]
}

public func +(_ lhs: Translated<String>, _ rhs: Translated<String>) -> Translated<String> {
    return Translated<String>(dutch: lhs(in: .dutch) + rhs(in: .dutch), english: lhs(in: .english) + rhs(in: .english))
}

extension Translated: CustomStringConvertible where A == String {
    public var description: String {
        @Dependency(\.language) var language
        return self.callAsFunction(language: language)
    }
}

extension Translated: ExpressibleByUnicodeScalarLiteral where A == String {
    public init(unicodeScalarLiteral value: String) {
        self.init(value)
    }

    public typealias UnicodeScalarLiteralType = String

}

extension Translated: ExpressibleByExtendedGraphemeClusterLiteral where A == String {
    public typealias ExtendedGraphemeClusterLiteralType = String

}

extension Translated: ExpressibleByStringLiteral & ExpressibleByStringInterpolation where A == String {
    public init(stringLiteral: String) {
        self.init(stringLiteral)
    }
}

public extension Translated where A == String {
    static let empty: Self = .init("")
}

public extension Translated where A == String {

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

public extension Translated {
    @available(*, deprecated, message: "Dutch should precede English")
    init(
        english: A,
        dutch: A
    ) {
        self.init(dutch: dutch, english: english)
    }
}
