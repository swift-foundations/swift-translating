import Testing
import Translating
import Dependencies
import Language
import Translated
import TranslatedString
import SinglePlural
import DateFormattedLocalized
import Foundation

@Suite("README Verification")
struct ReadmeVerificationTests {

    // MARK: - Quick Start Example

    @Test("Quick Start example from README lines 38-59")
    func quickStartExample() throws {
        // Create translated content
        let greeting: TranslatedString = [
            .english: "Hello",
            .dutch: "Hallo",
            .french: "Bonjour"
        ]

        // Use with dependency injection
        withDependencies {
            $0.language = .dutch
        } operation: {
            #expect(greeting.description == "Hallo")
        }

        // Direct language access
        let englishGreeting = greeting[.english]
        #expect(englishGreeting == "Hello")

        let koreanGreeting = greeting[.korean]
        #expect(koreanGreeting == "Hello") // fallback to English
    }

    // MARK: - Translation Creation Examples

    @Test("Dictionary literal syntax from README lines 67-74")
    func dictionaryLiteralSyntax() {
        let welcome: TranslatedString = [
            .english: "Welcome",
            .dutch: "Welkom",
            .french: "Bienvenue",
            .spanish: "Bienvenido"
        ]

        #expect(welcome[.english] == "Welcome")
        #expect(welcome[.dutch] == "Welkom")
        #expect(welcome[.french] == "Bienvenue")
        #expect(welcome[.spanish] == "Bienvenido")
    }

    @Test("Parameter-based initialization from README lines 78-85")
    func parameterBasedInitialization() {
        let notification = TranslatedString(
            "New message",
            dutch: "Nieuw bericht",
            french: "Nouveau message",
            german: "Neue Nachricht"
        )

        #expect(notification[.english] == "New message")
        #expect(notification[.dutch] == "Nieuw bericht")
        #expect(notification[.french] == "Nouveau message")
        #expect(notification[.german] == "Neue Nachricht")
    }

    @Test("String literal initialization from README lines 89-91")
    func stringLiteralInitialization() {
        let message: TranslatedString = "Hello World"

        #expect(message[.english] == "Hello World")
        #expect(message[.dutch] == "Hello World") // fallback to default
    }

    // MARK: - Language Fallback Examples

    @Test("Language fallback system from README lines 97-106")
    func languageFallbackSystem() {
        let text: TranslatedString = [
            .english: "Hello",
            .dutch: "Hallo"
        ]

        #expect(text[.afrikaans] == "Hallo")     // afrikaans → dutch → english
        #expect(text[.limburgish] == "Hallo")    // limburgish → dutch → english
        #expect(text[.chinese] == "Hello")       // chinese → english
    }

    // MARK: - Dependency Injection Examples

    @Test("Dependency injection from README lines 117-128")
    func dependencyInjection() {
        let greeting: TranslatedString = [
            .english: "Hello",
            .french: "Bonjour"
        ]

        withDependencies {
            $0.language = .french
        } operation: {
            #expect(greeting.description == "Bonjour")
        }
    }

    // MARK: - Singular/Plural Forms Examples

    @Test("Singular/plural forms from README lines 135-144")
    func singularPluralForms() {
        let single: TranslatedString = [.english: "item", .dutch: "item"]
        let plural: TranslatedString = [.english: "items", .dutch: "items"]

        let itemLabel = SinglePlural(
            single: single,
            plural: plural
        )

        withDependencies {
            $0.language = .english
        } operation: {
            let singleMessage = itemLabel(variant: .single)
            #expect(singleMessage.description == "item")

            let pluralMessage = itemLabel(variant: .plural)
            #expect(pluralMessage.description == "items")
        }
    }

    // MARK: - Date Formatting Examples

    @Test("Localized date formatting from README lines 150-160")
    func localizedDateFormatting() {
        withDependencies {
            $0.locale = Locale(identifier: "en_US")
        } operation: {
            let date = Date()
            let formatted = date.formatted(
                date: .complete,
                time: .shortened,
                translated: true
            )

            // Verify it creates a TranslatedString
            #expect(formatted is TranslatedString)

            // Verify it has content for different languages
            withDependencies {
                $0.language = .english
                $0.locale = Locale(identifier: "en_US")
            } operation: {
                #expect(!formatted.description.isEmpty)
            }

            withDependencies {
                $0.language = .dutch
                $0.locale = Locale(identifier: "nl_NL")
            } operation: {
                #expect(!formatted.description.isEmpty)
            }
        }
    }

    // MARK: - Generic Translation Container Examples

    @Test("Generic translation container from README lines 166-179")
    func genericTranslationContainer() {
        let prices: Translated<Double> = [
            .english: 9.99,
            .dutch: 8.99,
            .french: 10.99
        ]

        let dutchPrice = prices[.dutch]
        #expect(dutchPrice == 8.99)

        let settings: Translated<Bool> = [
            .english: true,
            .dutch: false
        ]

        #expect(settings[.english] == true)
        #expect(settings[.dutch] == false)
    }

    // MARK: - String Operations Examples

    @Test("String operations from README lines 185-195")
    func stringOperations() {
        let greeting: TranslatedString = [.english: "hello", .dutch: "hallo"]

        let capitalized = greeting.capitalized
        #expect(capitalized.english == "Hello")
        #expect(capitalized.dutch == "Hallo")

        let withPunctuation = greeting.period
        #expect(withPunctuation.english == "hello.")
        #expect(withPunctuation.dutch == "hallo.")

        // Concatenation
        let prefix: TranslatedString = [.english: "Good ", .dutch: "Goeie "]
        let time: TranslatedString = [.english: "morning", .dutch: "morgen"]
        let combined = prefix + time

        #expect(combined.english == "Good morning")
        #expect(combined.dutch == "Goeie morgen")
    }

    // MARK: - Performance Examples

    @Test("Dictionary literal performance recommendation from README lines 238-243")
    func dictionaryLiteralPerformance() {
        // ✅ Preferred - Fast dictionary literal
        let text: TranslatedString = [
            .english: "Hello",
            .dutch: "Hallo"
        ]

        #expect(text[.english] == "Hello")
        #expect(text[.dutch] == "Hallo")
    }
}
