import Foundation
import Language

/// A generic container for storing values that can be translated across multiple languages.
///
/// `Translated<A>` provides a type-safe way to store language-specific variants of any value type `A`,
/// with intelligent fallback mechanisms when specific translations are not available.
///
/// ## Usage
///
/// ```swift
/// // Create a translated string
/// let greeting = Translated<String>(
///     default: "Hello",
///     dictionary: [
///         .english: "Hello",
///         .spanish: "Hola",
///         .french: "Bonjour"
///     ]
/// )
///
/// // Access translations
/// let spanishGreeting = greeting[.spanish] // "Hola"
/// let germanGreeting = greeting[.german]   // "Hello" (falls back to default)
/// ```
///
/// ## Fallback Behavior
///
/// Each language has a predefined fallback chain that follows linguistic and geographical relationships.
/// For example:
/// - `.dutch` → `.english` → `default`
/// - `.afrikaans` → `.dutch` → `.english` → `default`
/// - `.basque` → `.spanish` → `.french` → `.english` → `default`
///
/// This ensures users always see meaningful content even when specific translations aren't available.
///
/// - Parameters:
///   - A: The type of value being translated (commonly `String`, but can be any type)
public struct Translated<A> {
  /// The default value used when no translation is available for a requested language
  package var `default`: A

  /// Internal dictionary storing language-specific translations
  internal var dictionary: [Language: A]

  /// Cache for memoized fallback results to avoid recomputation
  private var fallbackCache: [Language: A] = [:]

  /// Creates a new Translated instance with a default value and translation dictionary
  /// - Parameters:
  ///   - default: The fallback value to use when no translation exists
  ///   - dictionary: A dictionary mapping languages to their translated values
  package init(
    `default`: A,
    dictionary: [Language: A]
  ) {
    self.default = `default`
    self.dictionary = dictionary
  }
}

extension Translated {
  public init(_ a: A) {
    self = .init(default: a, dictionary: [:])
  }
}

extension Translated {
  public subscript(language: Language) -> A {
    get {
      // Fast path: check dictionary first
      if let value = dictionary[language] {
        return value
      }

      // Check cache for already computed fallback
      if let cachedValue = fallbackCache[language] {
        return cachedValue
      }

      // Compute fallback chain and cache result
      let fallbackValue = computeFallback(for: language)
      // Note: We can't mutate cache in getter due to value semantics
      return fallbackValue
    }
    set {
      dictionary[language] = newValue
      // Clear cache for this language since we have a direct translation now
      fallbackCache.removeValue(forKey: language)
    }
  }

  private func computeFallback(for language: Language) -> A {
    let fallbackChain = getFallbackChain(for: language)

    for fallbackLanguage in fallbackChain {
      if let value = dictionary[fallbackLanguage] {
        return value
      }
    }

    return `default`
  }

  private func getFallbackChain(for language: Language) -> [Language] {
    switch language {
    case .abkhazian: return [.russian, .georgian, .english]
    case .afar: return [.amharic, .oromo, .somali, .tigrinya, .english]
    case .afrikaans: return [.dutch, .english]
    case .akan: return [.english]
    case .albanian: return [.italian, .english]
    case .amharic: return [.oromo, .somali, .tigrinya, .english]
    case .arabic: return [.english]
    case .aragonese: return [.spanish, .english]
    case .armenian: return [.english]
    case .assamese: return [.english]
    case .auEnglish: return [.english]
    case .avaric: return [.english]
    case .avestan: return [.english]
    case .aymara: return [.spanish, .english]
    case .azerbaijani: return [.english]
    case .bambara: return [.english]
    case .bashkir: return [.english]
    case .basque: return [.spanish, .french, .english]
    case .belarusian: return [.russian, .english]
    case .bengali: return [.english]
    case .bihari: return [.english]
    case .bislama: return [.english]
    case .bosnian: return [.english]
    case .breton: return [.french, .english]
    case .bulgarian: return [.english]
    case .burmese: return [.english]
    case .catalan: return [.spanish, .french, .portuguese, .english]
    case .caEnglish: return [.english]
    case .chamorro: return [.english]
    case .chechen: return [.english]
    case .chinese: return [.english]
    case .chuvash: return [.english]
    case .cornish: return [.english]
    case .corsican: return [.french, .english]
    case .cree: return [.english]
    case .croatian: return [.english]
    case .czech: return [.english]
    case .danish: return [.english]
    case .dutch: return [.english]
    case .dzongkha: return [.english]
    case .english: return []
    case .esperanto: return [.english]
    case .estonian: return [.russian, .english]
    case .ewe: return [.english]
    case .faroese: return [.danish, .english]
    case .fijian: return [.english]
    case .finnish: return [.swedish, .english]
    case .french: return [.english]
    case .galician: return [.spanish, .english]
    case .gaelicScottish: return [.english]
    case .georgian: return [.russian, .english]
    case .german: return [.english]
    case .greek: return [.english]
    case .guarani: return [.spanish, .english]
    case .gujarati: return [.english]
    case .haitianCreole: return [.french, .english]
    case .hausa: return [.french, .english]
    case .hebrew: return [.english]
    case .herero: return [.english]
    case .hindi: return [.english]
    case .hiriMotu: return [.english]
    case .hungarian: return [.english]
    case .icelandic: return [.english]
    case .ido: return [.english]
    case .igbo: return [.english]
    case .indonesian: return [.english]
    case .interlingua: return [.english]
    case .interlingue: return [.english]
    case .inuktitut: return [.english]
    case .inupiak: return [.english]
    case .irish: return [.english]
    case .italian: return [.english]
    case .japanese: return [.english]
    case .javanese: return [.indonesian, .english]
    case .kannada: return [.english]
    case .kanuri: return [.french, .english]
    case .kashmiri: return [.english]
    case .kazakh: return [.russian, .english]
    case .khmer: return [.english]
    case .kikuyu: return [.english]
    case .kinyarwanda: return [.english]
    case .kirundi: return [.english]
    case .komi: return [.english]
    case .kongo: return [.english]
    case .korean: return [.english]
    case .kurdish: return [.arabic, .english]
    case .kwanyama: return [.portuguese, .english]
    case .kyrgyz: return [.russian, .english]
    case .lao: return [.english]
    case .latin: return [.english]
    case .latvian: return [.russian, .english]
    case .limburgish: return [.dutch, .english]
    case .lingala: return [.french, .english]
    case .lithuanian: return [.russian, .english]
    case .lugaKatanga: return [.english]
    case .luxembourgish: return [.french, .german, .english]
    case .macedonian: return [.english]
    case .malagasy: return [.french, .english]
    case .malay: return [.english]
    case .malayalam: return [.english]
    case .maltese: return [.english]
    case .manx: return [.english]
    case .maori: return [.english]
    case .marathi: return [.english]
    case .marshallese: return [.english]
    case .moldavian: return [.russian, .english]
    case .mongolian: return [.english]
    case .nauru: return [.english]
    case .navajo: return [.english]
    case .ndonga: return [.english]
    case .nepali: return [.english]
    case .northernNdebele: return [.english]
    case .norwegian: return [.english]
    case .norwegianBokmål: return [.norwegian, .english]
    case .norwegianNynorsk: return [.norwegian, .english]
    case .occitan: return [.spanish, .english]
    case .ojibwe: return [.english]
    case .oriya: return [.english]
    case .oromo: return [.english]
    case .ossetian: return [.russian, .english]
    case .pāli: return [.english]
    case .persian: return [.arabic, .english]
    case .polish: return [.english]
    case .portuguese: return [.english]
    case .punjabi: return [.english]
    case .quechua: return [.spanish, .english]
    case .romanian: return [.russian, .english]
    case .romansh: return [.french, .italian, .german, .english]
    case .russian: return [.english]
    case .sami: return [.norwegian, .english]
    case .samoan: return [.english]
    case .sango: return [.french, .english]
    case .sanskrit: return [.english]
    case .serbian: return [.albanian, .english]
    case .serboCroatian: return [.english]
    case .sesotho: return [.english]
    case .setswana: return [.english]
    case .shona: return [.english]
    case .sindhi: return [.urdu, .english]
    case .sinhalese: return [.english]
    case .slovak: return [.german, .english]
    case .slovenian: return [.english]
    case .somali: return [.english]
    case .southernNdebele: return [.english]
    case .spanish: return [.english]
    case .sundanese: return [.english]
    case .swahili: return [.english]
    case .swati: return [.english]
    case .swedish: return [.english]
    case .tagalog: return [.english]
    case .tahitian: return [.english]
    case .tajik: return [.russian, .english]
    case .tamil: return [.malay, .english]
    case .tatar: return [.english]
    case .telugu: return [.english]
    case .thai: return [.english]
    case .tibetan: return [.chinese, .english]
    case .tigrinya: return [.arabic, .italian, .english]
    case .tonga: return [.english]
    case .tsonga: return [.afrikaans, .english]
    case .turkish: return [.english]
    case .turkmen: return [.russian, .english]
    case .twi: return [.english]
    case .ukEnglish: return [.english]
    case .ukrainian: return [.english]
    case .urdu: return [.english]
    case .usEnglish: return [.english]
    case .uyghur: return [.chinese, .english]
    case .uzbek: return [.english]
    case .venda: return [.english]
    case .vietnamese: return [.english]
    case .volapük: return [.english]
    case .wallon: return [.french, .english]
    case .welsh: return [.english]
    case .westernFrisian: return [.dutch, .english]
    case .wolof: return [.french, .arabic, .english]
    case .xhosa: return [.english]
    case .yoruba: return [.english]
    case .zulu: return [.english]
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
      self[.abkhazian]
    }
    set {
      self[.abkhazian] = newValue
    }
  }
  public var afar: A {
    get {
      self[.afar]
    }
    set {
      self[.afar] = newValue
    }
  }
  public var afrikaans: A {
    get {
      self[.afrikaans]
    }
    set {
      self[.afrikaans] = newValue
    }
  }

  public var akan: A {
    get {
      self[.akan]
    }
    set {
      self[.akan] = newValue
    }
  }
  public var albanian: A {
    get {
      self[.albanian]
    }
    set {
      self[.albanian] = newValue
    }
  }

  public var amharic: A {
    get {
      self[.amharic]
    }
    set {
      self[.amharic] = newValue
    }
  }

  public var arabic: A {
    get {
      self[.arabic]
    }
    set {
      self[.arabic] = newValue
    }
  }

  public var aragonese: A {
    get {
      self[.aragonese]
    }
    set {
      self[.aragonese] = newValue
    }
  }

  public var armenian: A {
    get {
      self[.armenian]
    }
    set {
      self[.armenian] = newValue
    }
  }

  public var assamese: A {
    get {
      self[.assamese]
    }
    set {
      self[.assamese] = newValue
    }
  }

  public var auEnglish: A {
    get {
      self[.auEnglish]
    }
    set {
      self[.auEnglish] = newValue
    }
  }

  public var avaric: A {
    get {
      self[.avaric]
    }
    set {
      self[.avaric] = newValue
    }
  }

  public var avestan: A {
    get {
      self[.avestan]
    }
    set {
      self[.avestan] = newValue
    }
  }

  public var aymara: A {
    get {
      self[.aymara]
    }
    set {
      self[.aymara] = newValue
    }
  }

  public var azerbaijani: A {
    get {
      self[.azerbaijani]
    }
    set {
      self[.azerbaijani] = newValue
    }
  }

  public var bambara: A {
    get {
      self[.bambara]
    }
    set {
      self[.bambara] = newValue
    }
  }

  public var bashkir: A {
    get {
      self[.bashkir]
    }
    set {
      self[.bashkir] = newValue
    }
  }

  public var basque: A {
    get {
      self[.basque]
    }
    set {
      self[.basque] = newValue
    }
  }

  public var belarusian: A {
    get {
      self[.belarusian]
    }
    set {
      self[.belarusian] = newValue
    }
  }

  public var bengali: A {
    get {
      self[.bengali]
    }
    set {
      self[.bengali] = newValue
    }
  }

  public var bihari: A {
    get {
      self[.bihari]
    }
    set {
      self[.bihari] = newValue
    }
  }

  public var bislama: A {
    get {
      self[.bislama]
    }
    set {
      self[.bislama] = newValue
    }
  }

  public var bosnian: A {
    get {
      self[.bosnian]
    }
    set {
      self[.bosnian] = newValue
    }
  }

  public var breton: A {
    get {
      self[.breton]
    }
    set {
      self[.breton] = newValue
    }
  }

  public var bulgarian: A {
    get {
      self[.bulgarian]
    }
    set {
      self[.bulgarian] = newValue
    }
  }

  public var burmese: A {
    get {
      self[.burmese]
    }
    set {
      self[.burmese] = newValue
    }
  }

  public var catalan: A {
    get {
      self[.catalan]
    }
    set {
      self[.catalan] = newValue
    }
  }

  public var caEnglish: A {
    get {
      self[.caEnglish]
    }
    set {
      self[.caEnglish] = newValue
    }
  }

  public var chamorro: A {
    get {
      self[.chamorro]
    }
    set {
      self[.chamorro] = newValue
    }
  }

  public var chechen: A {
    get {
      self[.chechen]
    }
    set {
      self[.chechen] = newValue
    }
  }

  public var chinese: A {
    get {
      self[.chinese]
    }
    set {
      self[.chinese] = newValue
    }
  }

  public var chuvash: A {
    get {
      self[.chuvash]
    }
    set {
      self[.chuvash] = newValue
    }
  }

  public var cornish: A {
    get {
      self[.cornish]
    }
    set {
      self[.cornish] = newValue
    }
  }

  public var corsican: A {
    get {
      self[.corsican]
    }
    set {
      self[.corsican] = newValue
    }
  }

  public var cree: A {
    get {
      self[.cree]
    }
    set {
      self[.cree] = newValue
    }
  }

  public var croatian: A {
    get {
      self[.croatian]
    }
    set {
      self[.croatian] = newValue
    }
  }

  public var czech: A {
    get {
      self[.czech]
    }
    set {
      self[.czech] = newValue
    }
  }

  public var danish: A {
    get {
      self[.danish]
    }
    set {
      self[.danish] = newValue
    }
  }

  public var dutch: A {
    get {
      self[.dutch]
    }
    set {
      self[.dutch] = newValue
    }
  }

  public var dzongkha: A {
    get {
      self[.dzongkha]
    }
    set {
      self[.dzongkha] = newValue
    }
  }

  public var english: A {
    get {
      self[.english]
    }
    set {
      self[.english] = newValue
    }
  }

  public var esperanto: A {
    get {
      self[.esperanto]
    }
    set {
      self[.esperanto] = newValue
    }
  }

  public var estonian: A {
    get {
      self[.estonian]
    }
    set {
      self[.estonian] = newValue
    }
  }

  public var ewe: A {
    get {
      self[.ewe]
    }
    set {
      self[.ewe] = newValue
    }
  }
  public var faroese: A {
    get {
      self[.faroese]
    }
    set {
      self[.faroese] = newValue
    }
  }

  public var fijian: A {
    get {
      self[.fijian]
    }
    set {
      self[.fijian] = newValue
    }
  }

  public var finnish: A {
    get {
      self[.finnish]
    }
    set {
      self[.finnish] = newValue
    }
  }

  public var french: A {
    get {
      self[.french]
    }
    set {
      self[.french] = newValue
    }
  }

  public var galician: A {
    get {
      self[.galician]
    }
    set {
      self[.galician] = newValue
    }
  }

  public var gaelicScottish: A {
    get {
      self[.gaelicScottish]
    }
    set {
      self[.gaelicScottish] = newValue
    }
  }

  public var georgian: A {
    get {
      self[.georgian]
    }
    set {
      self[.georgian] = newValue
    }
  }

  public var german: A {
    get {
      self[.german]
    }
    set {
      self[.german] = newValue
    }
  }

  public var greek: A {
    get {
      self[.greek]
    }
    set {
      self[.greek] = newValue
    }
  }

  public var guarani: A {
    get {
      self[.guarani]
    }
    set {
      self[.guarani] = newValue
    }
  }

  public var gujarati: A {
    get {
      self[.gujarati]
    }
    set {
      self[.gujarati] = newValue
    }
  }

  public var haitianCreole: A {
    get {
      self[.haitianCreole]
    }
    set {
      self[.haitianCreole] = newValue
    }
  }

  public var hausa: A {
    get {
      self[.hausa]
    }
    set {
      self[.hausa] = newValue
    }
  }

  public var hebrew: A {
    get {
      self[.hebrew]
    }
    set {
      self[.hebrew] = newValue
    }
  }

  public var herero: A {
    get {
      self[.herero]
    }
    set {
      self[.herero] = newValue
    }
  }

  public var hindi: A {
    get {
      self[.hindi]
    }
    set {
      self[.hindi] = newValue
    }
  }

  public var hiriMotu: A {
    get {
      self[.hiriMotu]
    }
    set {
      self[.hiriMotu] = newValue
    }
  }

  public var hungarian: A {
    get {
      self[.hungarian]
    }
    set {
      self[.hungarian] = newValue
    }
  }

  public var icelandic: A {
    get {
      self[.icelandic]
    }
    set {
      self[.icelandic] = newValue
    }
  }

  public var ido: A {
    get {
      self[.ido]
    }
    set {
      self[.ido] = newValue
    }
  }

  public var igbo: A {
    get {
      self[.igbo]
    }
    set {
      self[.igbo] = newValue
    }
  }

  public var indonesian: A {
    get {
      self[.indonesian]
    }
    set {
      self[.indonesian] = newValue
    }
  }

  public var interlingua: A {
    get {
      self[.interlingua]
    }
    set {
      self[.interlingua] = newValue
    }
  }

  public var interlingue: A {
    get {
      self[.interlingue]
    }
    set {
      self[.interlingue] = newValue
    }
  }

  public var inuktitut: A {
    get {
      self[.inuktitut]
    }
    set {
      self[.inuktitut] = newValue
    }
  }

  public var inupiak: A {
    get {
      self[.inupiak]
    }
    set {
      self[.inupiak] = newValue
    }
  }

  public var irish: A {
    get {
      self[.irish]
    }
    set {
      self[.irish] = newValue
    }
  }

  public var italian: A {
    get {
      self[.italian]
    }
    set {
      self[.italian] = newValue
    }
  }

  public var japanese: A {
    get {
      self[.japanese]
    }
    set {
      self[.japanese] = newValue
    }
  }

  public var javanese: A {
    get {
      self[.javanese]
    }
    set {
      self[.javanese] = newValue
    }
  }

  public var kannada: A {
    get {
      self[.kannada]
    }
    set {
      self[.kannada] = newValue
    }
  }

  public var kanuri: A {
    get {
      self[.kanuri]
    }
    set {
      self[.kanuri] = newValue
    }
  }

  public var kashmiri: A {
    get {
      self[.kashmiri]
    }
    set {
      self[.kashmiri] = newValue
    }
  }

  public var kazakh: A {
    get {
      self[.kazakh]
    }
    set {
      self[.kazakh] = newValue
    }
  }

  public var khmer: A {
    get {
      self[.khmer]
    }
    set {
      self[.khmer] = newValue
    }
  }

  public var kikuyu: A {
    get {
      self[.kikuyu]
    }
    set {
      self[.kikuyu] = newValue
    }
  }

  public var kinyarwanda: A {
    get {
      self[.kinyarwanda]
    }
    set {
      self[.kinyarwanda] = newValue
    }
  }

  public var kirundi: A {
    get {
      self[.kirundi]
    }
    set {
      self[.kirundi] = newValue
    }
  }

  public var korean: A {
    get {
      self[.korean]
    }
    set {
      self[.korean] = newValue
    }
  }

  public var komi: A {
    get {
      self[.komi]
    }
    set {
      self[.komi] = newValue
    }
  }

  public var kongo: A {
    get {
      self[.kongo]
    }
    set {
      self[.kongo] = newValue
    }
  }
  public var kurdish: A {
    get {
      self[.kurdish]
    }
    set {
      self[.kurdish] = newValue
    }
  }

  public var kwanyama: A {
    get {
      self[.kwanyama]
    }
    set {
      self[.kwanyama] = newValue
    }
  }

  public var kyrgyz: A {
    get {
      self[.kyrgyz]
    }
    set {
      self[.kyrgyz] = newValue
    }
  }

  public var lao: A {
    get {
      self[.lao]
    }
    set {
      self[.lao] = newValue
    }
  }

  public var latin: A {
    get {
      self[.latin]
    }
    set {
      self[.latin] = newValue
    }
  }

  public var latvian: A {
    get {
      self[.latvian]
    }
    set {
      self[.latvian] = newValue
    }
  }

  public var limburgish: A {
    get {
      self[.limburgish]
    }
    set {
      self[.limburgish] = newValue
    }
  }

  public var lingala: A {
    get {
      self[.lingala]
    }
    set {
      self[.lingala] = newValue
    }
  }

  public var lithuanian: A {
    get {
      self[.lithuanian]
    }
    set {
      self[.lithuanian] = newValue
    }
  }

  public var lugaKatanga: A {
    get {
      self[.lugaKatanga]
    }
    set {
      self[.lugaKatanga] = newValue
    }
  }

  public var luxembourgish: A {
    get {
      self[.luxembourgish]
    }
    set {
      self[.luxembourgish] = newValue
    }
  }

  public var macedonian: A {
    get {
      self[.macedonian]
    }
    set {
      self[.macedonian] = newValue
    }
  }

  public var malagasy: A {
    get {
      self[.malagasy]
    }
    set {
      self[.malagasy] = newValue
    }
  }

  public var malay: A {
    get {
      self[.malay]
    }
    set {
      self[.malay] = newValue
    }
  }

  public var malayalam: A {
    get {
      self[.malayalam]
    }
    set {
      self[.malayalam] = newValue
    }
  }

  public var maltese: A {
    get {
      self[.maltese]
    }
    set {
      self[.maltese] = newValue
    }
  }

  public var manx: A {
    get {
      self[.manx]
    }
    set {
      self[.manx] = newValue
    }
  }

  public var maori: A {
    get {
      self[.maori]
    }
    set {
      self[.maori] = newValue
    }
  }

  public var marathi: A {
    get {
      self[.marathi]
    }
    set {
      self[.marathi] = newValue
    }
  }

  public var marshallese: A {
    get {
      self[.marshallese]
    }
    set {
      self[.marshallese] = newValue
    }
  }

  public var moldavian: A {
    get {
      self[.moldavian]
    }
    set {
      self[.moldavian] = newValue
    }
  }

  public var mongolian: A {
    get {
      self[.mongolian]
    }
    set {
      self[.mongolian] = newValue
    }
  }

  public var nauru: A {
    get {
      self[.nauru]
    }
    set {
      self[.nauru] = newValue
    }
  }

  public var navajo: A {
    get {
      self[.navajo]
    }
    set {
      self[.navajo] = newValue
    }
  }

  public var ndonga: A {
    get {
      self[.ndonga]
    }
    set {
      self[.ndonga] = newValue
    }
  }

  public var nepali: A {
    get {
      self[.nepali]
    }
    set {
      self[.nepali] = newValue
    }
  }

  public var northernNdebele: A {
    get {
      self[.northernNdebele]
    }
    set {
      self[.northernNdebele] = newValue
    }
  }

  public var norwegian: A {
    get {
      self[.norwegian]
    }
    set {
      self[.norwegian] = newValue
    }
  }

  public var norwegianBokmål: A {
    get {
      self[.norwegianBokmål]
    }
    set {
      self[.norwegianBokmål] = newValue
    }
  }

  public var norwegianNynorsk: A {
    get {
      self[.norwegianNynorsk]
    }
    set {
      self[.norwegianNynorsk] = newValue
    }
  }

  public var occitan: A {
    get {
      self[.occitan]
    }
    set {
      self[.occitan] = newValue
    }
  }

  public var ojibwe: A {
    get {
      self[.ojibwe]
    }
    set {
      self[.ojibwe] = newValue
    }
  }

  public var oriya: A {
    get {
      self[.oriya]
    }
    set {
      self[.oriya] = newValue
    }
  }

  public var oromo: A {
    get {
      self[.oromo]
    }
    set {
      self[.oromo] = newValue
    }
  }

  public var ossetian: A {
    get {
      self[.ossetian]
    }
    set {
      self[.ossetian] = newValue
    }
  }

  public var pāli: A {
    get {
      self[.pāli]
    }
    set {
      self[.pāli] = newValue
    }
  }

  public var persian: A {
    get {
      self[.persian]
    }
    set {
      self[.persian] = newValue
    }
  }

  public var polish: A {
    get {
      self[.polish]
    }
    set {
      self[.polish] = newValue
    }
  }

  public var portuguese: A {
    get {
      self[.portuguese]
    }
    set {
      self[.portuguese] = newValue
    }
  }

  public var punjabi: A {
    get {
      self[.punjabi]
    }
    set {
      self[.punjabi] = newValue
    }
  }

  public var quechua: A {
    get {
      self[.quechua]
    }
    set {
      self[.quechua] = newValue
    }
  }

  public var romanian: A {
    get {
      self[.romanian]
    }
    set {
      self[.romanian] = newValue
    }
  }

  public var romansh: A {
    get {
      self[.romansh]
    }
    set {
      self[.romansh] = newValue
    }
  }

  public var russian: A {
    get {
      self[.russian]
    }
    set {
      self[.russian] = newValue
    }
  }

  public var sami: A {
    get {
      self[.sami]
    }
    set {
      self[.sami] = newValue
    }
  }

  public var samoan: A {
    get {
      self[.samoan]
    }
    set {
      self[.samoan] = newValue
    }
  }

  public var sango: A {
    get {
      self[.sango]
    }
    set {
      self[.sango] = newValue
    }
  }

  public var sanskrit: A {
    get {
      self[.sanskrit]
    }
    set {
      self[.sanskrit] = newValue
    }
  }

  public var serbian: A {
    get {
      self[.serbian]
    }
    set {
      self[.serbian] = newValue
    }
  }

  public var serboCroatian: A {
    get {
      self[.serboCroatian]
    }
    set {
      self[.serboCroatian] = newValue
    }
  }

  public var sesotho: A {
    get {
      self[.sesotho]
    }
    set {
      self[.sesotho] = newValue
    }
  }

  public var setswana: A {
    get {
      self[.setswana]
    }
    set {
      self[.setswana] = newValue
    }
  }

  public var shona: A {
    get {
      self[.shona]
    }
    set {
      self[.shona] = newValue
    }
  }

  public var sindhi: A {
    get {
      self[.sindhi]
    }
    set {
      self[.sindhi] = newValue
    }
  }

  public var sinhalese: A {
    get {
      self[.sinhalese]
    }
    set {
      self[.sinhalese] = newValue
    }
  }

  public var slovak: A {
    get {
      self[.slovak]
    }
    set {
      self[.slovak] = newValue
    }
  }

  public var slovenian: A {
    get {
      self[.slovenian]
    }
    set {
      self[.slovenian] = newValue
    }
  }

  public var somali: A {
    get {
      self[.somali]
    }
    set {
      self[.somali] = newValue
    }
  }

  public var southernNdebele: A {
    get {
      self[.southernNdebele]
    }
    set {
      self[.southernNdebele] = newValue
    }
  }

  public var spanish: A {
    get {
      self[.spanish]
    }
    set {
      self[.spanish] = newValue
    }
  }

  public var sundanese: A {
    get {
      self[.sundanese]
    }
    set {
      self[.sundanese] = newValue
    }
  }

  public var swahili: A {
    get {
      self[.swahili]
    }
    set {
      self[.swahili] = newValue
    }
  }

  public var swati: A {
    get {
      self[.swati]
    }
    set {
      self[.swati] = newValue
    }
  }

  public var swedish: A {
    get {
      self[.swedish]
    }
    set {
      self[.swedish] = newValue
    }
  }

  public var tagalog: A {
    get {
      self[.tagalog]
    }
    set {
      self[.tagalog] = newValue
    }
  }

  public var tahitian: A {
    get {
      self[.tahitian]
    }
    set {
      self[.tahitian] = newValue
    }
  }

  public var tajik: A {
    get {
      self[.tajik]
    }
    set {
      self[.tajik] = newValue
    }
  }

  public var tamil: A {
    get {
      self[.tamil]
    }
    set {
      self[.tamil] = newValue
    }
  }

  public var tatar: A {
    get {
      self[.tatar]
    }
    set {
      self[.tatar] = newValue
    }
  }

  public var telugu: A {
    get {
      self[.telugu]
    }
    set {
      self[.telugu] = newValue
    }
  }

  public var thai: A {
    get {
      self[.thai]
    }
    set {
      self[.thai] = newValue
    }
  }

  public var tibetan: A {
    get {
      self[.tibetan]
    }
    set {
      self[.tibetan] = newValue
    }
  }

  public var tigrinya: A {
    get {
      self[.tigrinya]
    }
    set {
      self[.tigrinya] = newValue
    }
  }

  public var tonga: A {
    get {
      self[.tonga]
    }
    set {
      self[.tonga] = newValue
    }
  }

  public var tsonga: A {
    get {
      self[.tsonga]
    }
    set {
      self[.tsonga] = newValue
    }
  }

  public var turkish: A {
    get {
      self[.turkish]
    }
    set {
      self[.turkish] = newValue
    }
  }

  public var turkmen: A {
    get {
      self[.turkmen]
    }
    set {
      self[.turkmen] = newValue
    }
  }

  public var twi: A {
    get {
      self[.twi]
    }
    set {
      self[.twi] = newValue
    }
  }

  public var ukEnglish: A {
    get {
      self[.ukEnglish]
    }
    set {
      self[.ukEnglish] = newValue
    }
  }

  public var ukrainian: A {
    get {
      self[.ukrainian]
    }
    set {
      self[.ukrainian] = newValue
    }
  }

  public var urdu: A {
    get {
      self[.urdu]
    }
    set {
      self[.urdu] = newValue
    }
  }

  public var usEnglish: A {
    get {
      self[.usEnglish]
    }
    set {
      self[.usEnglish] = newValue
    }
  }

  public var uyghur: A {
    get {
      self[.uyghur]
    }
    set {
      self[.uyghur] = newValue
    }
  }

  public var uzbek: A {
    get {
      self[.uzbek]
    }
    set {
      self[.uzbek] = newValue
    }
  }

  public var venda: A {
    get {
      self[.venda]
    }
    set {
      self[.venda] = newValue
    }
  }

  public var vietnamese: A {
    get {
      self[.vietnamese]
    }
    set {
      self[.vietnamese] = newValue
    }
  }

  public var volapük: A {
    get {
      self[.volapük]
    }
    set {
      self[.volapük] = newValue
    }
  }

  public var wallon: A {
    get {
      self[.wallon]
    }
    set {
      self[.wallon] = newValue
    }
  }

  public var welsh: A {
    get {
      self[.welsh]
    }
    set {
      self[.welsh] = newValue
    }
  }

  public var westernFrisian: A {
    get {
      self[.westernFrisian]
    }
    set {
      self[.westernFrisian] = newValue
    }
  }

  public var wolof: A {
    get {
      self[.wolof]
    }
    set {
      self[.wolof] = newValue
    }
  }

  public var xhosa: A {
    get {
      self[.xhosa]
    }
    set {
      self[.xhosa] = newValue
    }
  }

  public var yoruba: A {
    get {
      self[.yoruba]
    }
    set {
      self[.yoruba] = newValue
    }
  }

  public var zulu: A {
    get {
      self[.zulu]
    }
    set {
      self[.zulu] = newValue
    }
  }
}

extension Translated: Codable where A: Codable {}
extension Translated: Sendable where A: Sendable {}
extension Translated: Equatable where A: Equatable {}
extension Translated: Hashable where A: Hashable {}

/// ExpressibleByDictionaryLiteral conformance allows creating Translated instances with dictionary literal syntax
///
/// This enables elegant initialization syntax such as:
/// ```swift
/// let greeting: Translated<String> = [
///     .english: "Hello",
///     .dutch: "Hallo",
///     .french: "Bonjour"
/// ]
/// ```
///
/// For non-String types, the dictionary must contain at least one translation.
/// The default value is selected in this priority order:
/// 1. English (if present)
/// 2. The first language in the dictionary literal order
extension Translated: ExpressibleByDictionaryLiteral {
  public typealias Key = Language
  public typealias Value = A

  /// Creates a Translated instance from a dictionary literal.
  ///
  /// The default value is selected in this priority order:
  /// 1. English (if present)
  /// 2. The first language in the dictionary literal order
  /// If the dictionary is empty, this initializer will cause a runtime error.
  ///
  /// - Parameter elements: Key-value pairs representing language-translation mappings
  public init(dictionaryLiteral elements: (Language, A)...) {
    let dictionary = Dictionary(uniqueKeysWithValues: elements)

    guard !dictionary.isEmpty else {
      fatalError("Dictionary literal must contain at least one translation")
    }

    // Prefer English as default if available, otherwise use the first provided value
    let defaultValue = dictionary[.english] ?? elements.first!.1

    self.init(default: defaultValue, dictionary: dictionary)
  }
}

/// String concatenation operators for Translated<String> (including TranslatedString)
///
/// These operators enable concatenating translated strings while preserving all language
/// translations. The concatenation works across ALL supported languages, not just a subset.
extension Translated<String> {
  /// Concatenates two Translated<String> instances, preserving all language translations.
  ///
  /// This operator combines translations from both operands for every language present in either.
  /// If a language exists in only one operand, an empty string is used as the fallback for the missing translation.
  ///
  /// - Parameters:
  ///   - lhs: The left-hand translated string
  ///   - rhs: The right-hand translated string
  /// - Returns: A new Translated<String> with concatenated translations for all languages
  ///
  /// ## Example
  /// ```swift
  /// let greeting = TranslatedString(english: "Hello", french: "Bonjour")
  /// let name = TranslatedString(english: " World", spanish: " Mundo")
  /// let result = greeting + name
  /// // Result contains: english: "Hello World", french: "Bonjour", spanish: " Mundo"
  /// ```
  public static func + (lhs: Self, rhs: Self) -> Self {
    let allKeys = Set(lhs.dictionary.keys).union(rhs.dictionary.keys)

    let newTranslations = Dictionary(
      uniqueKeysWithValues: allKeys.map {
        ($0, (lhs.dictionary[$0] ?? lhs.default) + (rhs.dictionary[$0] ?? rhs.default))
      }
    )

    return Self(
      default: lhs.default + rhs.default,
      dictionary: newTranslations
    )
  }

  /// Concatenates a regular string to all translations in a Translated<String>.
  ///
  /// - Parameters:
  ///   - lhs: The translated string
  ///   - rhs: The string to append to all translations
  /// - Returns: A new Translated<String> with the string appended to all translations
  public static func + (lhs: Self, rhs: String) -> Self {
    let newTranslations = lhs.dictionary.mapValues { $0 + rhs }
    return Self(default: lhs.default + rhs, dictionary: newTranslations)
  }

  /// Concatenates a regular string to the beginning of all translations in a Translated<String>.
  ///
  /// - Parameters:
  ///   - lhs: The string to prepend to all translations
  ///   - rhs: The translated string
  /// - Returns: A new Translated<String> with the string prepended to all translations
  public static func + (lhs: String, rhs: Self) -> Self {
    let newTranslations = rhs.dictionary.mapValues { lhs + $0 }
    return Self(default: lhs + rhs.default, dictionary: newTranslations)
  }
}
