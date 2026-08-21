import Testing

@testable import Language
@testable import Single_Plural
@testable import Translated

@Suite("Time unit content integrity")
struct Tests {

    private static let units: [(name: String, value: Translated<SinglePlural<String>>)] = [
        ("year", .year),
        ("month", .month),
        ("week", .week),
        ("day", .day),
        ("hour", .hour),
        ("minute", .minute),
        ("second", .second),
    ]

    @Test
    func `Second translates to seconde in French`() {
        let second = Translated<SinglePlural<String>>.second
        #expect(second[.french].single == "seconde")
        #expect(second[.french].plural == "secondes")
    }

    @Test
    func `No time unit duplicates another unit's value for the same language`() {
        for language in [Language.dutch, .english, .french, .german, .spanish] {
            for (i, lhs) in Self.units.enumerated() {
                for rhs in Self.units.dropFirst(i + 1) {
                    #expect(
                        lhs.value[language].single != rhs.value[language].single,
                        "\(lhs.name) and \(rhs.name) share the \(language) single form"
                    )
                    #expect(
                        lhs.value[language].plural != rhs.value[language].plural,
                        "\(lhs.name) and \(rhs.name) share the \(language) plural form"
                    )
                }
            }
        }
    }
}
