//
//  Language Dependency Tests.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Dependencies
import DependenciesTestSupport
import Language
import Testing
import Translated
import TranslatedString

@testable import Translating_Dependencies

@Suite(
  "Language Dependency Tests",
  .dependency(\.locale, .english)
)
struct LanguageDependencyTests {

  @Suite("Language Dependency Integration")
  struct LanguageDependencyIntegrationTests {

    @Test("Language dependency returns current language")
    func languageDependencyReturnsCurrentLanguage() {
      withDependencies {
        $0.language = .dutch
      } operation: {
        @Dependency(\.language) var language
        #expect(language == .dutch)
      }

      withDependencies {
        $0.language = .french
      } operation: {
        @Dependency(\.language) var language
        #expect(language == .french)
      }
    }

    @Test("Language dependency has correct default values")
    func languageDependencyHasCorrectDefaultValues() {
      #expect(Language.liveValue == .english)
      #expect(Language.testValue == .english)
      #expect(Language.previewValue == .english)
    }

    @Test("Languages dependency provides all languages by default")
    func languagesDependencyProvidesAllLanguagesByDefault() {
      withDependencies { _ in
        // Using default dependency values
      } operation: {
        @Dependency(\.languages) var languages
        #expect(languages.count == Language.allCases.count)
        #expect(languages.contains(.english))
        #expect(languages.contains(.dutch))
        #expect(languages.contains(.french))
      }
    }

    @Test("Languages dependency can be overridden")
    func languagesDependencyCanBeOverridden() {
      let customLanguages: Set<Language> = [.dutch, .french]

      withDependencies {
        $0.languages = customLanguages
      } operation: {
        @Dependency(\.languages) var languages
        #expect(languages == customLanguages)
        #expect(languages.count == 2)
        #expect(languages.contains(.dutch))
        #expect(languages.contains(.french))
        #expect(!languages.contains(.german))
      }
    }
  }

}
