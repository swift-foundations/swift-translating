import Foundation
import Language
import Translated

/// A specialized version of `Translated<String>` optimized for internationalized string handling.
///
/// `TranslatedString` is the most commonly used type in the Swift Translating package, providing
/// a convenient way to store and access strings in multiple languages with intelligent fallbacks.
///
/// ## Basic Usage
///
/// ```swift
/// let welcome = TranslatedString(
///     dutch: "Welkom",
///     english: "Welcome",
///     french: "Bienvenue",
///     german: "Willkommen",
///     spanish: "Bienvenido"
/// )
/// ```
///
/// ## String Literal Support
///
/// TranslatedString supports Swift string literals for quick creation:
///
/// ```swift
/// let message: TranslatedString = "Hello World" // Creates with English as default
/// ```
///
/// ## String Operations
///
/// TranslatedString supports common string operations that work across all languages:
///
/// ```swift
/// let greeting = TranslatedString(english: "hello", spanish: "hola")
/// let capitalizedGreeting = greeting.capitalized // "Hello" / "Hola"
/// let withPunctuation = greeting.period // "hello." / "hola."
/// ```
///
/// ## Usage with Dependencies
///
/// Use with Swift Dependencies for automatic language resolution:
///
/// ```swift
/// @Dependency(\.language) var language
/// let localizedText = welcome.description // Uses current language dependency
/// ```
///
/// - SeeAlso: ``Translated`` for the underlying generic implementation
/// - SeeAlso: ``Language`` for supported language codes
public typealias TranslatedString = Translated<String>

extension TranslatedString: ExpressibleByUnicodeScalarLiteral {
  public init(unicodeScalarLiteral value: String) {
    self.init(value)
  }

  public typealias UnicodeScalarLiteralType = String

}

extension TranslatedString: ExpressibleByExtendedGraphemeClusterLiteral {
  public typealias ExtendedGraphemeClusterLiteralType = String

}

extension TranslatedString: ExpressibleByStringLiteral & ExpressibleByStringInterpolation {
  public init(stringLiteral value: String) {
    self.init(value)
  }
}

extension TranslatedString {
  public static let empty: Self = TranslatedString(stringLiteral: "")
}

/// Specialized ExpressibleByDictionaryLiteral conformance for TranslatedString
///
/// This specialization allows empty dictionary literals for TranslatedString,
/// using an empty string as the sensible default value.
extension TranslatedString {
  /// Creates a TranslatedString instance from a dictionary literal.
  ///
  /// Empty dictionaries are allowed and will use an empty string as the default.
  /// For non-empty dictionaries, the default value is selected in this priority order:
  /// 1. English (if present)
  /// 2. The first language in the dictionary literal order
  ///
  /// - Parameter elements: Key-value pairs representing language-translation mappings
  public init(dictionaryLiteral elements: (Language, String)...) {
    if elements.isEmpty {
      self = TranslatedString.empty
    } else {
      let dictionary = Dictionary(uniqueKeysWithValues: elements)
      // Prefer English as default if available, otherwise use the first provided value
      let defaultValue = dictionary[.english] ?? elements.first!.1

      // Use the basic dictionary initializer instead of closure-based
      self.init(default: defaultValue, dictionary: dictionary)
    }
  }
}
