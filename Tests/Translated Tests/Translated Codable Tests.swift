//
//  Translated Codable Tests.swift
//  swift-translating
//

import Foundation
import Testing

@testable import Language
@testable import Translated

// Generic-namespace carve-out ([INST-TEST-013]): `Translated<A>` is generic,
// so a top-level `@Suite` `struct Tests` is used instead of a nested
// subdomain extension.
@Suite("Translated Codable wire format")
struct Tests {

    /// Mirrors the intended wire format: only `default` and `dictionary`.
    private struct Fixture: Codable {
        var `default`: String
        var dictionary: [Language: String]
    }

    /// Mirrors a legacy payload that still carries the removed
    /// `fallbackCache` key.
    private struct LegacyFixture: Codable {
        var `default`: String
        var dictionary: [Language: String]
        var fallbackCache: [Language: String]
    }

    /// Regression: fable-448 F-002. The never-populated `fallbackCache`
    /// stored property leaked into the synthesized Codable wire format.
    @Test
    func `Encoded payload matches the default-plus-dictionary wire format`() throws {
        let value = Translated<String>(default: "Hello", dictionary: [.dutch: "Hallo"])
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        let encoded = try encoder.encode(value)
        let expected = try encoder.encode(Fixture(default: "Hello", dictionary: [.dutch: "Hallo"]))
        #expect(String(decoding: encoded, as: UTF8.self) == String(decoding: expected, as: UTF8.self))
    }

    /// Regression: fable-448 F-002. Payloads containing only `default` and
    /// `dictionary` must decode.
    @Test
    func `Decodes a payload containing only default and dictionary`() throws {
        let fixture = try JSONEncoder().encode(Fixture(default: "Hello", dictionary: [.dutch: "Hallo"]))
        let value = try JSONDecoder().decode(Translated<String>.self, from: fixture)
        #expect(value.default == "Hello")
        #expect(value[.dutch] == "Hallo")
    }

    /// Legacy payloads that still carry the removed `fallbackCache` key
    /// decode tolerantly: keyed decoding ignores unknown keys.
    @Test
    func `Tolerates a legacy payload carrying the fallbackCache key`() throws {
        let fixture = try JSONEncoder().encode(
            LegacyFixture(default: "Hello", dictionary: [.dutch: "Hallo"], fallbackCache: [:])
        )
        let value = try JSONDecoder().decode(Translated<String>.self, from: fixture)
        #expect(value.default == "Hello")
        #expect(value[.dutch] == "Hallo")
    }

    /// Round trip stays lossless for the supported wire format.
    @Test
    func `Round trip preserves default and dictionary`() throws {
        let value = Translated<String>(default: "Hello", dictionary: [.dutch: "Hallo", .french: "Bonjour"])
        let decoded = try JSONDecoder().decode(
            Translated<String>.self,
            from: JSONEncoder().encode(value)
        )
        #expect(decoded.default == value.default)
        #expect(decoded.dictionary == value.dictionary)
    }
}
