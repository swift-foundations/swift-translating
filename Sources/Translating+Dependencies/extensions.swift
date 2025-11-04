//
//  File.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Dependencies
import Foundation
import Language
import Translated

extension Translated {
  /// Creates a Translated instance using a closure to generate values for each language.
  ///
  /// ⚠️ **Performance Warning**: This initializer has significant performance overhead and should be avoided.
  ///
  /// ## Performance Issues:
  /// - **Calls closure for every language** in the current language dependency (up to 179+ times)
  /// - **4.5x slower** than dictionary literal initialization
  /// - **Scales poorly** - more languages = more closure calls
  /// - **Expensive operations** (like API calls, database lookups) are magnified across all languages
  ///
  /// ## Recommended Alternatives:
  ///
  /// **Use dictionary literal syntax instead:**
  /// ```swift
  /// // ✅ PREFERRED - Fast dictionary literal
  /// let translated: Translated<String> = [
  ///     .english: "Hello",
  ///     .dutch: "Hallo",
  ///     .french: "Bonjour"
  /// ]
  ///
  /// // ❌ AVOID - Slow closure-based initialization
  /// let translated = Translated<String> { language in
  ///     expensiveTranslationLookup(for: language) // Called 179+ times!
  /// }
  /// ```
  ///
  /// **For parameter-based initialization:**
  /// ```swift
  /// // ✅ PREFERRED - Efficient parameter-based
  /// let translated = Translated<String>(
  ///     "Hello",
  ///     dutch: "Hallo",
  ///     french: "Bonjour"
  /// )
  /// ```
  ///
  /// ## When This Might Be Acceptable:
  /// - **Testing scenarios** where performance isn't critical
  /// - **Very simple closures** with minimal computational cost
  /// - **Limited language dependencies** (< 10 languages)
  ///
  /// - Parameter closure: A function that receives a language and returns the translated value
  /// - Warning: This closure will be called once for each language in the current language dependency plus once for the default value
  @available(
    *,
    deprecated,
    message:
      "Use dictionary literal syntax instead for better performance. This initializer calls the closure for every language in the dependency."
  )
  public init(
    _ closure: (Language) -> A
  ) {
    @Dependency(\.language) var language
    @Dependency(\.languages) var languages

    self = .init(
      default: closure(language),
      dictionary: Dictionary(uniqueKeysWithValues: languages.map { ($0, closure($0)) })
    )
  }
}

extension Language {
  public static func preferredLanguageForUser() -> Self {

    guard let language = Locale.preferredLanguages.first
    else {
      @Dependency(\.language) var language
      return language
    }

    return .init(locale: .init(identifier: language))
  }
}
