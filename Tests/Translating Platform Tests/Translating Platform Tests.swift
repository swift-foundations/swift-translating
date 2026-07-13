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

@Suite
struct `Translating Platform Tests` {

    @Suite
    struct `Preferred Language` {

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

    @Suite
    struct `Number In Writing` {

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

}
