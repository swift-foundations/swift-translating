import Foundation
import Testing

@testable import Language
@testable import Translated

@Suite("Translated Codable wire format")
struct Tests {

    private struct Fixture: Codable {
        var `default`: String
        var dictionary: [Language: String]
    }

    private struct LegacyFixture: Codable {
        var `default`: String
        var dictionary: [Language: String]
        var fallbackCache: [Language: String]
    }

    @Test
    func `Encoded payload matches the default-plus-dictionary wire format`() throws {
        let value = Translated<String>(default: "Hello", dictionary: [.dutch: "Hallo"])
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        let encoded = try encoder.encode(value)
        let expected = try encoder.encode(Fixture(default: "Hello", dictionary: [.dutch: "Hallo"]))
        #expect(
            String(decoding: encoded, as: UTF8.self) == String(decoding: expected, as: UTF8.self)
        )
    }

    @Test
    func `Decodes a payload containing only default and dictionary`() throws {
        let fixture = try JSONEncoder().encode(
            Fixture(default: "Hello", dictionary: [.dutch: "Hallo"])
        )
        let value = try JSONDecoder().decode(Translated<String>.self, from: fixture)
        #expect(value.default == "Hello")
        #expect(value[.dutch] == "Hallo")
    }

    @Test
    func `Tolerates a legacy payload carrying the fallbackCache key`() throws {
        let fixture = try JSONEncoder().encode(
            LegacyFixture(default: "Hello", dictionary: [.dutch: "Hallo"], fallbackCache: [:])
        )
        let value = try JSONDecoder().decode(Translated<String>.self, from: fixture)
        #expect(value.default == "Hello")
        #expect(value[.dutch] == "Hallo")
    }

    @Test
    func `Round trip preserves default and dictionary`() throws {
        let value = Translated<String>(
            default: "Hello",
            dictionary: [.dutch: "Hallo", .french: "Bonjour"]
        )
        let decoded = try JSONDecoder().decode(
            Translated<String>.self,
            from: JSONEncoder().encode(value)
        )
        #expect(decoded.default == value.default)
        #expect(decoded.dictionary == value.dictionary)
    }
}
