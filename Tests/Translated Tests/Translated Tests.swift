//
//  Translated Tests.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

@testable import Language
import Testing
@testable import Translated

@Suite("Translated Tests")
struct TranslatedTests {

    @Suite("Basic Functionality")
    struct BasicFunctionalityTests {

        @Test("Creates translated value with default")
        func createsTranslatedValueWithDefault() {
            let translated = Translated<String>(
                default: "Hello",
                dictionary: [
                    .dutch: "Hallo",
                    .french: "Bonjour"
                ]
            )

            #expect(translated.default == "Hello")
            #expect(translated[.dutch] == "Hallo")
            #expect(translated[.french] == "Bonjour")
        }

        @Test("Returns default when language not found")
        func returnsDefaultWhenLanguageNotFound() {
            let translated = Translated<String>(
                default: "Hello",
                dictionary: [.dutch: "Hallo"]
            )

            #expect(translated[.german] == "Hello")
            #expect(translated[.spanish] == "Hello")
        }

        @Test("Updates translation via subscript")
        func updatesTranslationViaSubscript() {
            var translated = Translated<String>(
                default: "Hello",
                dictionary: [:]
            )

            translated[.dutch] = "Hallo"
            translated[.french] = "Bonjour"

            #expect(translated[.dutch] == "Hallo")
            #expect(translated[.french] == "Bonjour")
        }
    }

    @Suite("Initializer Tests")
    struct InitializerTests {

        @Test("Simple dictionary literal initializer")
        func simpleDictionaryLiteralInitializer() {
            let translated: Translated<String> = [.english: "Default Value"]

            #expect(translated.default == "Default Value")
            #expect(translated[.english] == "Default Value")
            #expect(translated[.dutch] == "Default Value")
        }
    }

    @Suite("Language Fallback System")
    struct LanguageFallbackTests {

        @Test("Dutch falls back to English")
        func dutchFallsBackToEnglish() {
            let translated = Translated(
                default: "Default",
                dictionary: [.english: "Hello"]
            )

            // Dutch should fall back to English, then default
            #expect(translated.dutch == "Hello")
        }

        @Test("Afrikaans falls back through chain")
        func afrikaansFallsBackThroughChain() {
            let translated = Translated(
                default: "Default",
                dictionary: [
                    .dutch: "Hallo",
                    .english: "Hello"
                ]
            )

            // Afrikaans should fall back: afrikaans -> dutch -> english -> default
            #expect(translated.afrikaans == "Hallo")
        }

        @Test("Complex fallback chain")
        func complexFallbackChain() {
            let translated = Translated(
                default: "Default",
                dictionary: [
                    .spanish: "Hola",
                    .english: "Hello"
                ]
            )

            // Basque should fall back: basque -> spanish -> french -> english -> default
            #expect(translated.basque == "Hola")

            // Catalan should fall back: catalan -> spanish -> french -> portuguese -> english -> default  
            #expect(translated.catalan == "Hola")
        }

        @Test("Subscript accessor uses same fallback chains as properties")
        func subscriptAccessorUsesSameFallbackChainsAsProperties() {
            let translated = Translated(
                default: "Default",
                dictionary: [
                    .dutch: "Hallo",
                    .spanish: "Hola",
                    .english: "Hello"
                ]
            )

            // Both subscript and property should give same results with fallback chains
            #expect(translated[.afrikaans] == translated.afrikaans) // Should both be "Hallo" (via Dutch)
            #expect(translated[.basque] == translated.basque)       // Should both be "Hola" (via Spanish)
            #expect(translated[.dutch] == translated.dutch)         // Should both be "Hallo" (direct)
            #expect(translated[.german] == translated.german)       // Should both be "Hello" (via English)

            // Verify the actual fallback values
            #expect(translated[.afrikaans] == "Hallo")  // afrikaans -> dutch -> english -> default
            #expect(translated[.basque] == "Hola")      // basque -> spanish -> french -> english -> default
            #expect(translated[.german] == "Hello")     // german -> english -> default
        }
    }

    @Suite("String Concatenation")
    struct StringConcatenationTests {

        @Test("Concatenates two translated strings preserving all languages")
        func concatenatesTwoTranslatedStrings() {
            let greeting = Translated<String>(
                default: "Hello",
                dictionary: [
                    .dutch: "Hallo",
                    .french: "Bonjour"
                ]
            )

            let name = Translated<String>(
                default: " World",
                dictionary: [
                    .dutch: " Wereld",
                    .spanish: " Mundo"
                ]
            )

            let result = greeting + name

            #expect(result.default == "Hello World")
            #expect(result[.dutch] == "Hallo Wereld")
            #expect(result[.french] == "Bonjour World") // French + empty = "Bonjour"
            #expect(result[.spanish] == "Hello Mundo") // Empty + Spanish = " Mundo"
        }

        @Test("Concatenates translated string with regular string")
        func concatenatesTranslatedStringWithRegularString() {
            let greeting = Translated<String>(
                default: "Hello",
                dictionary: [
                    .dutch: "Hallo",
                    .french: "Bonjour"
                ]
            )

            let result = greeting + "!"

            #expect(result.default == "Hello!")
            #expect(result[.dutch] == "Hallo!")
            #expect(result[.french] == "Bonjour!")
        }

        @Test("Prepends regular string to translated string")
        func prependsRegularStringToTranslatedString() {
            let greeting = Translated<String>(
                default: "World",
                dictionary: [
                    .dutch: "Wereld",
                    .french: "Monde"
                ]
            )

            let result = "Hello " + greeting

            #expect(result.default == "Hello World")
            #expect(result[.dutch] == "Hello Wereld")
            #expect(result[.french] == "Hello Monde")
        }
    }

    @Suite("Protocol Conformances")
    struct ProtocolConformanceTests {

        @Test("Equatable conformance works correctly")
        func equatableConformanceWorks() {
            let translated1: Translated<String> = [.english: "Hello", .dutch: "Hallo"]
            let translated2: Translated<String> = [.english: "Hello", .dutch: "Hallo"]
            let translated3: Translated<String> = [.english: "Hi", .dutch: "Hallo"]

            #expect(translated1 == translated2)
            #expect(translated1 != translated3)
        }

        @Test("Hashable conformance works correctly")
        func hashableConformanceWorks() {
            let translated1: Translated<String> = [.english: "Hello", .dutch: "Hallo"]
            let translated2: Translated<String> = [.english: "Hello", .dutch: "Hallo"]

            let set: Set<Translated<String>> = [translated1, translated2]
            #expect(set.count == 1) // Should be deduplicated
        }
    }

    @Suite("ExpressibleByDictionaryLiteral")
    struct ExpressibleByDictionaryLiteralTests {

        @Test("Creates translated value from dictionary literal with English priority")
        func createsTranslatedValueFromDictionaryLiteralWithEnglishPriority() {
            let translated: Translated<String> = [
                .french: "Bonjour",
                .dutch: "Hallo",
                .english: "Hello"
            ]

            // Should use English as default when available
            #expect(translated.default == "Hello")
            #expect(translated[.english] == "Hello")
            #expect(translated[.dutch] == "Hallo")
            #expect(translated[.french] == "Bonjour")
            #expect(translated[.german] == "Hello") // Falls back to default
        }

        @Test("Uses first provided value when no English")
        func usesFirstProvidedValueWhenNoEnglish() {
            let translated: Translated<String> = [
                .spanish: "Hola",
                .dutch: "Hallo",
                .afrikaans: "Hallo"
            ]

            // Should use first provided value (Spanish) as default
            #expect(translated.default == "Hola")
            #expect(translated[.afrikaans] == "Hallo")
            #expect(translated[.dutch] == "Hallo")
            #expect(translated[.spanish] == "Hola")
        }

        @Test("Works with non-String types")
        func worksWithNonStringTypes() {
            let translated: Translated<Int> = [
                .dutch: 2,
                .english: 1,
                .french: 3
            ]

            // Should prefer English as default
            #expect(translated.default == 1)
            #expect(translated[.english] == 1)
            #expect(translated[.dutch] == 2)
            #expect(translated[.french] == 3)
            #expect(translated[.german] == 1) // Falls back to default
        }

        @Test("Single item dictionary literal")
        func singleItemDictionaryLiteral() {
            let translated: Translated<String> = [.german: "Hallo"]

            #expect(translated.default == "Hallo")
            #expect(translated[.german] == "Hallo")
            #expect(translated[.english] == "Hallo") // Falls back to default
        }

    }

    @Suite("Edge Cases")
    struct EdgeCaseTests {

        @Test("Empty translation dictionary")
        func emptyTranslationDictionary() {
            let translated = Translated<String>(
                default: "Default",
                dictionary: [:]
            )

            #expect(translated[.english] == "Default")
            #expect(translated[.dutch] == "Default")
            #expect(translated[.french] == "Default")
        }

        @Test("Generic type other than String")
        func genericTypeOtherThanString() {
            let translated = Translated<Int>(
                default: 0,
                dictionary: [
//                    .english: 1,
                    .dutch: 2,
                    .french: 3
                ]
            )

//            #expect(translated[.english] == 1)
            #expect(translated[.dutch] == 2)
            #expect(translated[.french] == 3)
            #expect(translated[.german] == 0) // Falls back to default
        }

        @Test("Very long language names")
        func veryLongLanguageNames() {
            let longString = String(repeating: "A", count: 1000)
            let translated = Translated(
                default: "Short",
                dictionary: [.french: longString]
            )

            #expect(translated[.french] == longString)
            #expect(translated[.dutch] == "Short")
        }

        @Test("Call as function syntax")
        func callAsFunctionSyntax() {
            let translated = Translated(
                default: "Default",
                dictionary: [
                    .dutch: "Hallo",
                    .french: "Bonjour"
                ]
            )

            #expect(translated(.dutch) == "Hallo")
            #expect(translated(.french) == "Bonjour")
            #expect(translated(.german) == "Default")
        }

        @Test("AllCases property returns all translations")
        func allCasesPropertyReturnsAllTranslations() {
            let translated = Translated(
                default: "Default",
                dictionary: [
                    .dutch: "Hallo",
                    .french: "Bonjour"
                ]
            )

            let allCases = translated.allCases
            #expect(allCases.contains("Hallo"))
            #expect(allCases.contains("Bonjour"))
            #expect(allCases.count == 2) // Only the translations, not the default
        }
    }
}
