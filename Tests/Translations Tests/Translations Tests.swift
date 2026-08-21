import Testing

@testable import Language
@testable import Translated
@testable import Translated_String
@testable import Translations

@Suite("Translations")
struct Tests {

    @Suite
    struct `ClosedRange Rendering` {

        @Test
        func `ClosedRange description matches the standard library rendering`() {
            #expect((1...5).description == "1...5")
        }

        @Test
        func `TranslatedString ClosedRange initializer still provides the localized phrase`() {
            let phrase = TranslatedString(1...5)
            #expect(phrase[.english] == "1 up to and including 5")
        }
    }

    @Suite
    struct `Phrase Content Integrity` {

        @Test
        func `in progress translates to en cours in French, distinct from done`() {
            #expect(TranslatedString.in_progress[.french] == "en cours")
            #expect(TranslatedString.in_progress[.french] != TranslatedString.done[.french])
        }
    }
}
