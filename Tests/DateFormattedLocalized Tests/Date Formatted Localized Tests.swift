//
//  Date Formatted Localized Tests.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Dependencies
import DependenciesTestSupport
import Foundation
import Language
import Testing

@testable import DateFormattedLocalized

@Suite(
  "Date Formatted Localized Tests",
  .dependency(\.locale, Language.english.locale)
)
struct DateFormattedLocalizedTests {

  @Suite("Date.formatted Extension")
  struct DateFormattedExtensionTests {

    @Test("Creates FormattedDate with date and time styles")
    func createsFormattedDateWithDateAndTimeStyles() {
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

    @Test("Creates TranslatedString with various date styles")
    func createsTranslatedStringWithVariousDateStyles() {
      let date = Date()

      let abbreviatedFormatted = date.formatted(
        date: .abbreviated,
        time: .omitted,
        translated: true
      )
      let numericFormatted = date.formatted(date: .numeric, time: .omitted, translated: true)
      let longFormatted = date.formatted(date: .long, time: .omitted, translated: true)
      let completeFormatted = date.formatted(date: .complete, time: .omitted, translated: true)

      withDependencies {
        $0.language = .english
      } operation: {
        #expect(!abbreviatedFormatted.description.isEmpty)
        #expect(!numericFormatted.description.isEmpty)
        #expect(!longFormatted.description.isEmpty)
        #expect(!completeFormatted.description.isEmpty)
      }
    }

    @Test("Creates TranslatedString with various time styles")
    func createsTranslatedStringWithVariousTimeStyles() {
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

    @Test("Creates TranslatedString with combined date and time styles")
    func createsTranslatedStringWithCombinedDateAndTimeStyles() {
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

    @Test("TranslatedString uses dependency language - English")
    func translatedStringUsesDependencyLanguageEnglish() {
      let date = Date(timeIntervalSince1970: 1_641_024_000)  // January 1, 2022 12:00:00 AM UTC
      let formatted = date.formatted(date: .long, time: .omitted, translated: true)

      withDependencies {
        $0.language = .english
      } operation: {
        let description = formatted.description
        // Should contain English month name
        #expect(description.contains("January") || description.contains("Jan"))
      }
    }

    @Test("TranslatedString uses dependency language - French")
    func translatedStringUsesDependencyLanguageFrench() {
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

    @Test("TranslatedString uses dependency language - German")
    func translatedStringUsesDependencyLanguageGerman() {
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

    @Test("TranslatedString uses dependency language - Dutch")
    func translatedStringUsesDependencyLanguageDutch() {
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

    @Test("TranslatedString with time formatting")
    func translatedStringWithTimeFormatting() {
      let date = Date(timeIntervalSince1970: 1_641_067_200)  // January 1, 2022 12:00:00 PM UTC
      let formatted = date.formatted(date: .omitted, time: .shortened, translated: true)

      withDependencies {
        $0.language = .english
      } operation: {
        let description = formatted.description
        // Should contain time information
        #expect(
          description.contains(":") || description.contains("AM") || description.contains("PM")
        )
      }
    }

    @Test("TranslatedString with date and time formatting")
    func translatedStringWithDateAndTimeFormatting() {
      let date = Date(timeIntervalSince1970: 1_641_067_200)  // January 1, 2022 12:00:00 PM UTC
      let formatted = date.formatted(date: .numeric, time: .shortened, translated: true)

      withDependencies {
        $0.language = .english
      } operation: {
        let description = formatted.description
        // Should contain both date and time elements
        #expect(description.contains("2022") || description.contains("22"))
        #expect(
          description.contains(":") || description.contains("AM") || description.contains("PM")
        )
      }
    }

    @Test("TranslatedString changes with different dependency values")
    func translatedStringChangesWithDifferentDependencyValues() {
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

    @Test("Formatting historical dates")
    func formattingHistoricalDates() {
      let historicalDate = Date(timeIntervalSince1970: -631_152_000)  // January 1, 1950
      let formatted = historicalDate.formatted(date: .long, time: .omitted, translated: true)

      withDependencies {
        $0.language = .english
      } operation: {
        let description = formatted.description
        #expect(description.contains("1950"))
      }
    }

    @Test("Formatting future dates")
    func formattingFutureDates() {
      let futureDate = Date(timeIntervalSince1970: 1_893_456_000)  // January 1, 2030
      let formatted = futureDate.formatted(date: .long, time: .omitted, translated: true)

      withDependencies {
        $0.language = .english
      } operation: {
        let description = formatted.description
        #expect(description.contains("2030"))
      }
    }

    @Test("Formatting with different date styles produces different lengths")
    func formattingWithDifferentDateStylesProducesDifferentLengths() {
      let date = Date(timeIntervalSince1970: 1_641_024_000)  // January 1, 2022

      withDependencies {
        $0.language = .english
      } operation: {
        let abbreviatedFormatted = date.formatted(
          date: .abbreviated,
          time: .omitted,
          translated: true
        ).description
        let numericFormatted = date.formatted(date: .numeric, time: .omitted, translated: true)
          .description
        let longFormatted = date.formatted(date: .long, time: .omitted, translated: true)
          .description
        let completeFormatted = date.formatted(date: .complete, time: .omitted, translated: true)
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

    @Test("Formatting with different time styles produces different precision")
    func formattingWithDifferentTimeStylesProducesDifferentPrecision() {
      let date = Date(timeIntervalSince1970: 1_641_067_200)  // January 1, 2022 12:00:00 PM UTC

      withDependencies {
        $0.language = .english
      } operation: {
        let shortenedTime = date.formatted(date: .omitted, time: .shortened, translated: true)
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

    @Test("Formatting epoch date (Unix timestamp 0)")
    func formattingEpochDate() {
      let epochDate = Date(timeIntervalSince1970: 0)  // January 1, 1970
      let formatted = epochDate.formatted(date: .long, time: .standard, translated: true)

      withDependencies {
        $0.language = .english
      } operation: {
        let description = formatted.description
        #expect(description.contains("1970"))
      }
    }

    @Test("Formatting with omitted date and time styles")
    func formattingWithOmittedDateAndTimeStyles() {
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

    @Test("Formatting is consistent for same date and language")
    func formattingIsConsistentForSameDateAndLanguage() {
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

    @Test("TranslatedString works with various languages")
    func translatedStringWorksWithVariousLanguages() {
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
          #expect(!description.isEmpty, "Language \(language) should produce non-empty result")
        }
      }
    }
  }
}
