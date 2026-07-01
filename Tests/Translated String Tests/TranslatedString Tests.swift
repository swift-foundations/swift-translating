//
//  TranslatedString Tests.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Translating_Platform
import Foundation
import Testing

@testable import Language
@testable import Translated
@testable import Translated_String

@Suite("TranslatedString Tests")
struct TranslatedStringTests {

    @Suite("ExpressibleByDictionaryLiteral")
    struct ExpressibleByDictionaryLiteralTests {

        @Test
        func `TranslatedString allows empty dictionary literal`() {
            let empty: TranslatedString = .empty

            #expect(empty.default == "")
            #expect(empty[.english] == "")
            #expect(empty[.dutch] == "")
            #expect(empty[.german] == "")
        }

        @Test
        func `TranslatedString uses English priority`() {
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

        @Test
        func `TranslatedString uses first provided when no English`() {
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

        @Test
        func `Single item TranslatedString dictionary literal`() {
            let translated: TranslatedString = [.italian: "Ciao"]

            #expect(translated.default == "Ciao")
            #expect(translated[.italian] == "Ciao")
            #expect(translated[.english] == "Ciao")  // Falls back to default
        }
    }

    @Suite("String Literal Conformances")
    struct StringLiteralTests {

        @Test
        func `TranslatedString from string literal`() {
            let translated: TranslatedString = "Hello World"

            #expect(translated.default == "Hello World")
            #expect(translated[.english] == "Hello World")
            #expect(translated[.dutch] == "Hello World")
        }

        @Test
        func `Empty string literal`() {
            let translated: TranslatedString = ""

            #expect(translated.default == "")
            #expect(translated[.english] == "")
            #expect(translated == .empty)
        }

        @Test
        func `Unicode scalar literal`() {
            let translated: TranslatedString = "👋"

            #expect(translated.default == "👋")
            #expect(translated[.english] == "👋")
        }
    }

    @Suite("Punctuation and Formatting")
    struct PunctuationTests {

        @Test
        func `Static punctuation constants`() {
            #expect(TranslatedString.period[.english] == ".")
            #expect(TranslatedString.comma[.english] == ",")
            #expect(TranslatedString.semicolon[.english] == ";")
            #expect(TranslatedString.questionmark[.english] == "?")
            #expect(TranslatedString.space[.english] == "\u{00a0}")
        }

        @Test
        func `Punctuation works across languages`() {
            let period = TranslatedString.period

            #expect(period[.english] == ".")
            #expect(period[.dutch] == ".")
            #expect(period[.french] == ".")
        }
    }

    @Suite("Separator Functionality")
    struct SeparatorTests {

        @Test
        func `And separator initialization`() {
            let separator = TranslatedString(.and)

            #expect(separator[.english] == "and")
            // Note: These are currently TODO items in the implementation
        }

        @Test
        func `Or separator initialization`() {
            let separator = TranslatedString(.or)

            #expect(separator[.english] == "or")
        }

        @Test
        func `And/Or separator initialization`() {
            let separator = TranslatedString(.andOr)

            #expect(separator[.english] == "and/or")
        }

        @Test
        func `String array alphabet constant`() {
            let alphabet = [String].alphabet

            #expect(alphabet.count == 26)
            #expect(alphabet.first == "a")
            #expect(alphabet.last == "z")
        }
    }

    @Suite("Language Array Extensions")
    struct LanguageArrayTests {

        @Test
        func `Language array sorting`() {
            let languages: [Language] = [.spanish, .english, .dutch, .french]
            let sorted = languages.sort()

            // Should be sorted alphabetically by tag string representation
            let sortedStrings = sorted.map { "\($0)" }
            let expectedSorted = ["en", "es", "fr", "nl"]

            #expect(sortedStrings == expectedSorted)
        }
    }

    @Suite("Date Extensions")
    struct DateExtensionTests {

        @Test
        func `Date placeholder functionality`() {
            let placeholder = Date.placeholder()

            #expect(placeholder[.dutch] == "__ ________________ 2021")
            #expect(placeholder[.english] == "________________ __, 2021")
        }
    }

    @Suite("String Array Formatting")
    struct StringArrayFormattingTests {

        @Test
        func `Formatted items with default conjunction`() {
            let items = ["apples", "bananas", "cherries"]
            let formatted = items.formattedItems()

            #expect(formatted.count == 3)
            #expect(formatted[0] == "apples;")
            #expect(formatted[1] == "bananas; and")
            #expect(formatted[2] == "cherries.")
        }

        @Test
        func `Formatted items with custom conjunction`() {
            let items = ["red", "blue"]
            let formatted = items.formattedItems(with: "or")

            #expect(formatted.count == 2)
            #expect(formatted[0] == "red; or")
            #expect(formatted[1] == "blue.")
        }

        @Test
        func `Single item formatting`() {
            let items = ["apple"]
            let formatted = items.formattedItems()

            #expect(formatted.count == 1)
            #expect(formatted[0] == "apple.")
        }

        @Test
        func `Line breaks functionality`() {
            let items = ["first", "second", "third"]
            let withBreaks = items.withLineBreaks()

            #expect(withBreaks[0] == "first\n")
            #expect(withBreaks[1] == "second\n")
            #expect(withBreaks[2] == "third")  // Last item has no line break
        }

        @Test
        func `Numbered list functionality`() {
            let items = ["task one", "task two"]
            let numbered = items.numberedList()

            #expect(numbered[0] == "1.\ttask one\n")
            #expect(numbered[1] == "2.\ttask two")
        }

        @Test
        func `Numbered list with custom start`() {
            let items = ["step", "another step"]
            let numbered = items.numberedList(startingAt: 5)

            #expect(numbered[0] == "5.\tstep\n")
            #expect(numbered[1] == "6.\tanother step")
        }

        @Test
        func `Numbered and signed functionality`() {
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

        @Test
        func `Numbered and signed with custom parameters`() {
            let items = ["alpha", "beta"]
            let result = items.numberedAndSigned(startingAt: 10, conjunction: "or")

            #expect(result[0].contains("10.\talpha"))
            #expect(result[1].contains("11.\tbeta"))
            #expect(result[0].contains("or"))
        }
    }

    @Suite("Core Functionality")
    struct CoreFunctionalityTests {

        @Test
        func `Map functionality`() {
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

        @Test
        func `Call as function syntax`() {
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

        @Test
        func `Array call as function syntax`() {
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
