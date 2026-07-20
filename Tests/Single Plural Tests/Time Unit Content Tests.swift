//
//  Time Unit Content Tests.swift
//  swift-translating
//

import Testing

@testable import Language
@testable import Single_Plural
@testable import Translated

// Generic-namespace carve-out ([INST-TEST-013]): the affected source extends
// the generic `Translated<SinglePlural<String>>`, so a top-level `@Suite`
// `struct Tests` is used instead of a nested subdomain extension.
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

    /// Regression: fable-448 F-006. The French entry for `.second` was
    /// copied from `.minute` ("minute"/"minutes").
    @Test
    func `Second translates to seconde in French`() {
        let second = Translated<SinglePlural<String>>.second
        #expect(second[.french].single == "seconde")
        #expect(second[.french].plural == "secondes")
    }

    /// Content integrity: no unit's value may equal another unit's value for
    /// the same language, in either the single or plural form.
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
