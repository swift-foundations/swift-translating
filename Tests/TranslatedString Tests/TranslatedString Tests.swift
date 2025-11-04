//
//  TranslatedString Tests.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Foundation
import Testing

@testable import Language
@testable import Translated
@testable import TranslatedString

@Suite("TranslatedString Tests")
struct TranslatedStringTests {

  @Suite("ExpressibleByDictionaryLiteral")
  struct ExpressibleByDictionaryLiteralTests {

    @Test("TranslatedString allows empty dictionary literal")
    func translatedStringAllowsEmptyDictionaryLiteral() {
      let empty: TranslatedString = .empty

      #expect(empty.default == "")
      #expect(empty[.english] == "")
      #expect(empty[.dutch] == "")
      #expect(empty[.german] == "")
    }

    @Test("TranslatedString uses English priority")
    func translatedStringUsesEnglishPriority() {
      let translated: TranslatedString = [
        .french: "Bonjour",
        .dutch: "Hallo",
        .english: "Hello",
      ]

      #expect(translated.default == "Hello")
      #expect(translated[.english] == "Hello")
      #expect(translated[.dutch] == "Hallo")
      #expect(translated[.french] == "Bonjour")
    }

    @Test("TranslatedString uses first provided when no English")
    func translatedStringUsesFirstProvidedWhenNoEnglish() {
      let translated: TranslatedString = [
        .spanish: "Hola",
        .dutch: "Hallo",
        .german: "Hallo",
      ]

      #expect(translated.default == "Hola")  // First provided
      #expect(translated[.spanish] == "Hola")
      #expect(translated[.dutch] == "Hallo")
      #expect(translated[.german] == "Hallo")
    }

    @Test("Single item TranslatedString dictionary literal")
    func singleItemTranslatedStringDictionaryLiteral() {
      let translated: TranslatedString = [.italian: "Ciao"]

      #expect(translated.default == "Ciao")
      #expect(translated[.italian] == "Ciao")
      #expect(translated[.english] == "Ciao")  // Falls back to default
    }
  }

  @Suite("String Literal Conformances")
  struct StringLiteralTests {

    @Test("TranslatedString from string literal")
    func translatedStringFromStringLiteral() {
      let translated: TranslatedString = "Hello World"

      #expect(translated.default == "Hello World")
      #expect(translated[.english] == "Hello World")
      #expect(translated[.dutch] == "Hello World")
    }

    @Test("Empty string literal")
    func emptyStringLiteral() {
      let translated: TranslatedString = ""

      #expect(translated.default == "")
      #expect(translated[.english] == "")
      #expect(translated == .empty)
    }

    @Test("Unicode scalar literal")
    func unicodeScalarLiteral() {
      let translated: TranslatedString = "👋"

      #expect(translated.default == "👋")
      #expect(translated[.english] == "👋")
    }
  }

  @Suite("Punctuation and Formatting")
  struct PunctuationTests {

    @Test("Static punctuation constants")
    func staticPunctuationConstants() {
      #expect(TranslatedString.period[.english] == ".")
      #expect(TranslatedString.comma[.english] == ",")
      #expect(TranslatedString.semicolon[.english] == ";")
      #expect(TranslatedString.questionmark[.english] == "?")
      #expect(TranslatedString.space[.english] == "\u{00a0}")
    }

    @Test("Punctuation works across languages")
    func punctuationWorksAcrossLanguages() {
      let period = TranslatedString.period

      #expect(period[.english] == ".")
      #expect(period[.dutch] == ".")
      #expect(period[.french] == ".")
    }
  }

  @Suite("Separator Functionality")
  struct SeparatorTests {

    @Test("And separator initialization")
    func andSeparatorInitialization() {
      let separator = TranslatedString(.and)

      #expect(separator[.english] == "and")
      // Note: These are currently TODO items in the implementation
    }

    @Test("Or separator initialization")
    func orSeparatorInitialization() {
      let separator = TranslatedString(.or)

      #expect(separator[.english] == "or")
    }

    @Test("And/Or separator initialization")
    func andOrSeparatorInitialization() {
      let separator = TranslatedString(.andOr)

      #expect(separator[.english] == "and/or")
    }

    @Test("String array alphabet constant")
    func stringArrayAlphabetConstant() {
      let alphabet = [String].alphabet

      #expect(alphabet.count == 26)
      #expect(alphabet.first == "a")
      #expect(alphabet.last == "z")
    }
  }

  @Suite("Language Array Extensions")
  struct LanguageArrayTests {

    @Test("Language array sorting")
    func languageArraySorting() {
      let languages: [Language] = [.spanish, .english, .dutch, .french]
      let sorted = languages.sort()

      // Should be sorted alphabetically by string representation
      let sortedStrings = sorted.map { "\($0)" }
      let expectedSorted = ["dutch", "english", "french", "spanish"]

      #expect(sortedStrings == expectedSorted)
    }
  }

  @Suite("Date Extensions")
  struct DateExtensionTests {

    @Test("Date placeholder functionality")
    func datePlaceholderFunctionality() {
      let placeholder = Date.placeholder()

      #expect(placeholder[.dutch] == "__ ________________ 2021")
      #expect(placeholder[.english] == "________________ __, 2021")
    }
  }

  @Suite("String Array Formatting")
  struct StringArrayFormattingTests {

    @Test("Formatted items with default conjunction")
    func formattedItemsWithDefaultConjunction() {
      let items = ["apples", "bananas", "cherries"]
      let formatted = items.formattedItems()

      #expect(formatted.count == 3)
      #expect(formatted[0] == "apples;")
      #expect(formatted[1] == "bananas; and")
      #expect(formatted[2] == "cherries.")
    }

    @Test("Formatted items with custom conjunction")
    func formattedItemsWithCustomConjunction() {
      let items = ["red", "blue"]
      let formatted = items.formattedItems(with: "or")

      #expect(formatted.count == 2)
      #expect(formatted[0] == "red; or")
      #expect(formatted[1] == "blue.")
    }

    @Test("Single item formatting")
    func singleItemFormatting() {
      let items = ["apple"]
      let formatted = items.formattedItems()

      #expect(formatted.count == 1)
      #expect(formatted[0] == "apple.")
    }

    @Test("Line breaks functionality")
    func lineBreaksFunctionality() {
      let items = ["first", "second", "third"]
      let withBreaks = items.withLineBreaks()

      #expect(withBreaks[0] == "first\n")
      #expect(withBreaks[1] == "second\n")
      #expect(withBreaks[2] == "third")  // Last item has no line break
    }

    @Test("Numbered list functionality")
    func numberedListFunctionality() {
      let items = ["task one", "task two"]
      let numbered = items.numberedList()

      #expect(numbered[0] == "1.\ttask one\n")
      #expect(numbered[1] == "2.\ttask two")
    }

    @Test("Numbered list with custom start")
    func numberedListWithCustomStart() {
      let items = ["step", "another step"]
      let numbered = items.numberedList(startingAt: 5)

      #expect(numbered[0] == "5.\tstep\n")
      #expect(numbered[1] == "6.\tanother step")
    }

    @Test("Numbered and signed functionality")
    func numberedAndSignedFunctionality() {
      let items = ["first item", "second item", "third item"]
      let result = items.numberedAndSigned()

      // This combines numberedList + formattedItems + withLineBreaks
      #expect(result.count == 3)
      #expect(result[0].contains("1.\tfirst item"))
      #expect(result[1].contains("2.\tsecond item"))
      #expect(result[1].contains("and"))
      #expect(result[2].contains("3.\tthird item"))
      #expect(result[2].hasSuffix("."))
    }

    @Test("Numbered and signed with custom parameters")
    func numberedAndSignedWithCustomParameters() {
      let items = ["alpha", "beta"]
      let result = items.numberedAndSigned(startingAt: 10, conjunction: "or")

      #expect(result[0].contains("10.\talpha"))
      #expect(result[1].contains("11.\tbeta"))
      #expect(result[0].contains("or"))
    }
  }

  @Suite("Core Functionality")
  struct CoreFunctionalityTests {

    @Test("Map functionality")
    func mapFunctionality() {
      let numbers: Translated<Int> = Translated(
        default: 5,
        dictionary: [.english: 1, .dutch: 2, .french: 3]
      )

      let strings = numbers.map { "\($0)" }

      #expect(strings.default == "5")
      #expect(strings[.english] == "1")
      #expect(strings[.dutch] == "2")
      #expect(strings[.french] == "3")
    }

    @Test("Call as function syntax")
    func callAsFunctionSyntax() {
      let greeting: TranslatedString = [
        .english: "Hello",
        .dutch: "Hallo",
      ]

      #expect(greeting(.english) == "Hello")
      #expect(greeting(language: .dutch) == "Hallo")
      #expect(greeting(with: .english) == "Hello")
      #expect(greeting(in: .dutch) == "Hallo")
      #expect(greeting(for: .english) == "Hello")
    }

    @Test("Array call as function syntax")
    func arrayCallAsFunctionSyntax() {
      let greetings: [TranslatedString] = [
        [.english: "Hello", .dutch: "Hallo"],
        [.english: "Goodbye", .dutch: "Dag"],
      ]

      let englishGreetings = greetings(.english)
      let dutchGreetings = greetings(language: .dutch)

      #expect(englishGreetings == ["Hello", "Goodbye"])
      #expect(dutchGreetings == ["Hallo", "Dag"])
    }
  }
}
