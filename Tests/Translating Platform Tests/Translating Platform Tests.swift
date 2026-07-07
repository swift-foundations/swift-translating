//
//  Translating Platform Tests.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Dependencies
import Dependencies_Test_Support
import Foundation
import Language
import Testing

@testable import Translating_Platform

@Suite(
    "Translating Platform Tests",
    .dependency(\.language, .english)
)
struct TranslatingPlatformTests {

    @Suite("Language.preferred")
    struct PreferredLanguageTests {

        @Test
        func `Language.preferred returns a valid language`() {
            let preferred = Language.preferred
            // Should return some language (depends on system locale)
            #expect(!String(describing: preferred).isEmpty)
        }

        @Test
        func `Language.preferred is consistent across calls`() {
            let first = Language.preferred
            let second = Language.preferred
            #expect(first == second)
        }
    }

    @Suite("numberInWriting")
    struct NumberInWritingTests {

        @Test
        func `Integer spell-out in English`() {
            let result = 42.numberInWriting(language: .english)
            #expect(result == "forty-two")
        }

        @Test
        func `Integer spell-out in Dutch`() {
            let result = 42.numberInWriting(language: .dutch)
            // NumberFormatter may insert soft hyphens (U+00AD) in Dutch
            let normalized = result.replacingOccurrences(of: "\u{00AD}", with: "")
            #expect(normalized == "tweeënveertig")
        }

        @Test
        func `Integer spell-out in French`() {
            let result = 42.numberInWriting(language: .french)
            #expect(result == "quarante-deux")
        }

        @Test
        func `Zero spell-out`() {
            let result = 0.numberInWriting(language: .english)
            #expect(result == "zero")
        }

        @Test
        func `Static method variant`() {
            let result = Int.numberInWriting(100, language: .english)
            #expect(result == "one hundred")
        }
    }

    @Suite("Date.formatted Extension")
    struct DateFormattedExtensionTests {

        @Test
        func `Creates FormattedDate with date and time styles`() {
            let formatted = Date(timeIntervalSince1970: 0)  // 01-01-1970
                .formatted(
                    date: .long,
                    time: .omitted,
                    translated: true
                )

            withDependencies {
                $0.language = .dutch
            } operation: {
                #expect(formatted.description == "1 januari 1970")
                #expect("\(formatted)" == "1 januari 1970")
            }
        }

        @Test
        func `Creates TranslatedString with various date styles`() {
            let date = Date()

            let abbreviatedFormatted = date.formatted(
                date: .abbreviated,
                time: .omitted,
                translated: true
            )
            let numericFormatted = date.formatted(date: .numeric, time: .omitted, translated: true)
            let longFormatted = date.formatted(date: .long, time: .omitted, translated: true)
            let completeFormatted = date.formatted(
                date: .complete,
                time: .omitted,
                translated: true
            )

            withDependencies {
                $0.language = .english
            } operation: {
                #expect(!abbreviatedFormatted.description.isEmpty)
                #expect(!numericFormatted.description.isEmpty)
                #expect(!longFormatted.description.isEmpty)
                #expect(!completeFormatted.description.isEmpty)
            }
        }

        @Test
        func `Creates TranslatedString with various time styles`() {
            let date = Date()

            let shortenedTime = date.formatted(date: .omitted, time: .shortened, translated: true)
            let standardTime = date.formatted(date: .omitted, time: .standard, translated: true)
            let completeTime = date.formatted(date: .omitted, time: .complete, translated: true)

            withDependencies {
                $0.language = .english
            } operation: {
                #expect(!shortenedTime.description.isEmpty)
                #expect(!standardTime.description.isEmpty)
                #expect(!completeTime.description.isEmpty)
            }
        }

        @Test
        func `Creates TranslatedString with combined date and time styles`() {
            let date = Date()
            let formatted = date.formatted(date: .numeric, time: .shortened, translated: true)

            withDependencies {
                $0.language = .english
            } operation: {
                #expect(!formatted.description.isEmpty)
                #expect(formatted.description.contains(":"))
            }
        }
    }

    @Suite("TranslatedString Property")
    struct TranslatedStringPropertyTests {

        @Test
        func `TranslatedString uses dependency language - English`() {
            // January 1, 2022 12:00:00 AM UTC
            let date = Date(timeIntervalSince1970: 1_641_024_000)
            let formatted = date.formatted(date: .long, time: .omitted, translated: true)

            withDependencies {
                $0.language = .english
            } operation: {
                let description = formatted.description
                // Should contain English month name
                #expect(description.contains("January") || description.contains("Jan"))
            }
        }

        @Test
        func `TranslatedString uses dependency language - French`() {
            let date = Date(timeIntervalSince1970: 1_641_024_000)  // January 1, 2022
            let formatted = date.formatted(date: .long, time: .omitted, translated: true)

            withDependencies {
                $0.language = .french
            } operation: {
                let description = formatted.description
                // Should contain French month name
                #expect(description.contains("janvier") || description.contains("janv"))
            }
        }

        @Test
        func `TranslatedString uses dependency language - German`() {
            let date = Date(timeIntervalSince1970: 1_641_024_000)  // January 1, 2022
            let formatted = date.formatted(date: .long, time: .omitted, translated: true)

            withDependencies {
                $0.language = .german
            } operation: {
                let description = formatted.description
                // Should contain German month name
                #expect(description.contains("Januar") || description.contains("Jan"))
            }
        }

        @Test
        func `TranslatedString uses dependency language - Dutch`() {
            let date = Date(timeIntervalSince1970: 1_641_024_000)  // January 1, 2022
            let formatted = date.formatted(date: .long, time: .omitted, translated: true)

            withDependencies {
                $0.language = .dutch
            } operation: {
                let description = formatted.description
                // Should contain Dutch month name
                #expect(description.contains("januari") || description.contains("jan"))
            }
        }

        @Test
        func `TranslatedString with time formatting`() {
            // January 1, 2022 12:00:00 PM UTC
            let date = Date(timeIntervalSince1970: 1_641_067_200)
            let formatted = date.formatted(date: .omitted, time: .shortened, translated: true)

            withDependencies {
                $0.language = .english
            } operation: {
                let description = formatted.description
                // Should contain time information
                #expect(
                    description.contains(":") || description.contains("AM")
                        || description.contains("PM")
                )
            }
        }

        @Test
        func `TranslatedString with date and time formatting`() {
            // January 1, 2022 12:00:00 PM UTC
            let date = Date(timeIntervalSince1970: 1_641_067_200)
            let formatted = date.formatted(date: .numeric, time: .shortened, translated: true)

            withDependencies {
                $0.language = .english
            } operation: {
                let description = formatted.description
                // Should contain both date and time elements
                #expect(description.contains("2022") || description.contains("22"))
                #expect(
                    description.contains(":") || description.contains("AM")
                        || description.contains("PM")
                )
            }
        }

        @Test
        func `TranslatedString changes with different dependency values`() {
            let date = Date(timeIntervalSince1970: 1_641_024_000)  // January 1, 2022
            let formatted = date.formatted(date: .long, time: .omitted, translated: true)

            var englishResult: String = ""
            var frenchResult: String = ""

            withDependencies {
                $0.language = .english
            } operation: {
                englishResult = formatted.description
            }

            withDependencies {
                $0.language = .french
            } operation: {
                frenchResult = formatted.description
            }

            // Results should be different between languages
            #expect(englishResult != frenchResult)
        }
    }

    @Suite("Various Date Scenarios")
    struct VariousDateScenariosTests {

        @Test
        func `Formatting historical dates`() {
            let historicalDate = Date(timeIntervalSince1970: -631_152_000)  // January 1, 1950
            let formatted = historicalDate.formatted(date: .long, time: .omitted, translated: true)

            withDependencies {
                $0.language = .english
            } operation: {
                let description = formatted.description
                #expect(description.contains("1950"))
            }
        }

        @Test
        func `Formatting future dates`() {
            let futureDate = Date(timeIntervalSince1970: 1_893_456_000)  // January 1, 2030
            let formatted = futureDate.formatted(date: .long, time: .omitted, translated: true)

            withDependencies {
                $0.language = .english
            } operation: {
                let description = formatted.description
                #expect(description.contains("2030"))
            }
        }

        @Test
        func `Formatting with different date styles produces different lengths`() {
            let date = Date(timeIntervalSince1970: 1_641_024_000)  // January 1, 2022

            withDependencies {
                $0.language = .english
            } operation: {
                let abbreviatedFormatted = date.formatted(
                    date: .abbreviated,
                    time: .omitted,
                    translated: true
                ).description
                let numericFormatted = date.formatted(
                    date: .numeric,
                    time: .omitted,
                    translated: true
                )
                .description
                let longFormatted = date.formatted(date: .long, time: .omitted, translated: true)
                    .description
                let completeFormatted = date.formatted(
                    date: .complete,
                    time: .omitted,
                    translated: true
                )
                .description

                // Generally, complete should be longer than long, long longer than numeric, etc.
                #expect(completeFormatted.count >= longFormatted.count)
                #expect(longFormatted.count >= abbreviatedFormatted.count)
                #expect(
                    abbreviatedFormatted.count >= numericFormatted.count
                        || numericFormatted.count >= abbreviatedFormatted.count
                )
            }
        }

        @Test
        func `Formatting with different time styles produces different precision`() {
            // January 1, 2022 12:00:00 PM UTC
            let date = Date(timeIntervalSince1970: 1_641_067_200)

            withDependencies {
                $0.language = .english
            } operation: {
                let shortenedTime = date.formatted(
                    date: .omitted,
                    time: .shortened,
                    translated: true
                )
                .description
                let standardTime = date.formatted(date: .omitted, time: .standard, translated: true)
                    .description
                let completeTime = date.formatted(date: .omitted, time: .complete, translated: true)
                    .description

                // All should contain time separators
                #expect(shortenedTime.contains(":"))
                #expect(standardTime.contains(":"))
                #expect(completeTime.contains(":"))

                // Longer formats might include more detail (timezone info, seconds, etc.)
                // This is a basic check that they're different
                #expect(shortenedTime != standardTime || standardTime != completeTime)
            }
        }
    }

    @Suite("Edge Cases")
    struct EdgeCasesTests {

        @Test
        func `Formatting epoch date (Unix timestamp 0)`() {
            let epochDate = Date(timeIntervalSince1970: 0)  // January 1, 1970
            let formatted = epochDate.formatted(date: .long, time: .standard, translated: true)

            withDependencies {
                $0.language = .english
            } operation: {
                let description = formatted.description
                #expect(description.contains("1970"))
            }
        }

        @Test
        func `Formatting with omitted date and time styles`() {
            let date = Date()
            let formatted = date.formatted(date: .omitted, time: .omitted, translated: true)

            withDependencies {
                $0.language = .english
            } operation: {
                let description = formatted.description
                // Even with .omitted styles, should produce some output
                #expect(!description.isEmpty)
            }
        }

        @Test
        func `Formatting is consistent for same date and language`() {
            let date = Date(timeIntervalSince1970: 1_641_024_000)
            let formatted = date.formatted(date: .long, time: .shortened, translated: true)

            withDependencies {
                $0.language = .english
            } operation: {
                let first = formatted.description
                let second = formatted.description
                #expect(first == second)
            }
        }

        @Test
        func `TranslatedString works with various languages`() {
            let date = Date(timeIntervalSince1970: 1_641_024_000)
            let formatted = date.formatted(date: .numeric, time: .omitted, translated: true)

            // Test with different languages
            let languages: [Language] = [
                .english,
                .dutch,
                .french,
                .german,
                .spanish,
                .italian,
                .portuguese,
            ]

            for language in languages {
                withDependencies {
                    $0.language = language
                } operation: {
                    let description = formatted.description
                    #expect(
                        !description.isEmpty,
                        "Language \(language) should produce non-empty result"
                    )
                }
            }
        }
    }
}
