//
//  File.swift
//  swift-language
//
//  Created by Coen ten Thije Boonkkamp on 30/12/2024.
//

import Dependencies
import Foundation
import Language

/// Dependency key for managing the set of languages used in translation contexts.
///
/// This key defines which languages should be included when creating translated content,
/// allowing fine-grained control over which translations are generated and cached.
public enum LanguagesKey: TestDependencyKey {
  /// Test value includes all available languages for comprehensive testing
  public static let testValue: Set<Language> = .allCases

  /// Convenience property for accessing all available languages
  public static let allLanguages: Set<Language> = .init(Language.allCases)
}

extension Set<Language> {
  /// Convenience property for creating a set of all available languages
  public static let allCases: Self = .init(Language.allCases)
}

extension DependencyValues {
  /// The set of languages to use when creating translated content.
  ///
  /// This dependency controls which languages are included when:
  /// - Creating `Translated` instances with closure-based initializers
  /// - Determining which translations to generate or cache
  /// - Filtering language-specific operations
  ///
  /// ## Usage
  ///
  /// ```swift
  /// // Limit translations to specific languages
  /// withDependencies {
  ///     $0.languages = [.english, .dutch, .french]
  /// } operation: {
  ///     let translated = Translated { language in
  ///         // Only called for English, Dutch, and French
  ///         lookupTranslation(for: language)
  ///     }
  /// }
  /// ```
  ///
  /// - Note: Defaults to all available languages in production
  public var languages: Set<Language> {
    get { self[LanguagesKey.self] }
    set { self[LanguagesKey.self] = newValue }
  }
}
