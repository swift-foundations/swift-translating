//
//  Translations Tests.swift
//  swift-translating
//

import Testing

@testable import Language
@testable import Translated
@testable import Translated_String
@testable import Translations

// Generic-namespace carve-out ([INST-TEST-013]): the affected source is an
// extension of the generic stdlib type `ClosedRange` and the generic
// `Translated<String>` phrase tables, so a top-level `@Suite` `struct Tests`
// is used instead of a nested subdomain extension.
@Suite("Translations")
struct Tests {

    @Suite
    struct `ClosedRange Rendering` {

        /// Regression: fable-448 F-001. A public `ClosedRange.description`
        /// extension shadowed the standard-library rendering and returned a
        /// reflection dump of `TranslatedString`.
        @Test
        func `ClosedRange description matches the standard library rendering`() {
            #expect((1...5).description == "1...5")
        }

        /// The localized range phrase remains available via the explicit,
        /// opt-in `TranslatedString` initializer.
        @Test
        func `TranslatedString ClosedRange initializer still provides the localized phrase`() {
            let phrase = TranslatedString(1...5)
            #expect(phrase[.english] == "1 up to and including 5")
        }
    }

    @Suite
    struct `Phrase Content Integrity` {

        /// Regression: fable-448 F-006. The French entry for `in_progress`
        /// was "fini" ("done") instead of "en cours".
        @Test
        func `in progress translates to en cours in French, distinct from done`() {
            #expect(TranslatedString.in_progress[.french] == "en cours")
            #expect(TranslatedString.in_progress[.french] != TranslatedString.done[.french])
        }
    }
}
