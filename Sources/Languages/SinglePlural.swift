//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 29/04/2022.
//

import Foundation

@dynamicMemberLookup
public struct SinglePlural<A> {
    public let single: A
    public let plural: A

    public var preferredA: A {
        switch preferred {
        case .single: return single
        case .plural: return plural
        }
    }

    public var preferred: Variant

    public var enkelvoud: A { single }
    public var meervoud: A { plural }

    public subscript<T>(dynamicMember keyPath: KeyPath<A, T>) -> T {
        switch preferred {
        case .single: return single[keyPath: keyPath]
        case .plural: return plural[keyPath: keyPath]
        }
    }

    public enum Variant: String, Codable, Hashable, Sendable {
        case single
        case plural
    }

    public func callAsFunction(with variant: Variant? = nil) -> A {
        callAsFunction(variant: variant)
    }

    public func callAsFunction(in variant: Variant? = nil) -> A {
        callAsFunction(variant: variant)
    }

    public func callAsFunction(for variant: Variant? = nil) -> A {
        callAsFunction(variant: variant)
    }
    public func callAsFunction(_ variant: Variant? = nil) -> A {
        callAsFunction(variant: variant)
    }

    public func callAsFunction(variant: Variant? = nil) -> A {
        switch variant {
        case .none: return self.preferredA
        case .single: return self.single
        case .plural: return self.plural
        }
    }

    public func map<B>(_ transform: (A) -> B) -> SinglePlural<B> {
        return SinglePlural<B>(single: transform(self.single), plural: transform(self.plural))
    }

    public func flatMap<B>(_ transform: (A) -> SinglePlural<B>) -> SinglePlural<B> {
        return SinglePlural<B>(single: transform(self.single).single, plural: transform(self.plural).plural)
    }

    public init(
        _ all: A,
        preferred: Variant = .single
    ) {
        self.single = all
        self.plural = all
        self.preferred = preferred
    }

    public init(
        preferred: Variant = .single,
        _ all: (Variant) -> A
    ) {
        self.single = all(.single)
        self.plural = all(.plural)
        self.preferred = preferred
    }

    public init(
        single: A,
        plural: A,
        preferred: Variant = .single
    ) {
        self.single = single
        self.plural = plural
        self.preferred = preferred
    }
}

public extension SinglePlural where A == Translated<String> {
    static let parties: Self = .init(single: .init(dutch: "Partij", english: "Party"), plural: .init(dutch: "Partijen", english: "Parties"))

    @available(*, deprecated, message: ".init(dutch:english)")
    init(english: String, dutch: String? = nil) {
        self = .init(Translated<String>(dutch: dutch, english: english))
    }

    init(dutch: String? = nil, english: String) {
        self = .init(Translated<String>(dutch: dutch, english: english))
    }

    func callAsFunction(_ variant: Variant = .single, _ language: Languages.Language) -> String {
        callAsFunction(variant: variant)(language)
    }

//    func callAsFunction(_ language:Languages.Language)->A {
//        callAsFunction(
//    }
}

// extension SinglePlural:CustomStringConvertible where A == Translated<String> {
//
//    public func callAsFunction(_ language:Languages.Language)->String {
//        self.single(language)
//    }
//
//    public init(
//        _ string:Translated<String>
//    ) {
//        self.single = string
//        self.plural = string
//    }
//
//    public init(
//        english:String,
//        dutch:String? = nil,
//        german:String? = nil,
//        italian:String? = nil,
//        spanish:String? = nil,
//        french:String? = nil,
//        swedish:String? = nil
//    ) {
//        self.single = .init(english: english, dutch: dutch, german: german, italian: italian, spanish: spanish, french: french, swedish: swedish)
//        self.plural = .init(english: english, dutch: dutch, german: german, italian: italian, spanish: spanish, french: french, swedish: swedish)
//    }
//
// }

// extension SinglePlural: ExpressibleByUnicodeScalarLiteral where A == Translated<String> {
//    public init(unicodeScalarLiteral value: Translated<String>) {
//        self.single = value
//        self.plural = value
//    }
//    
//    public typealias UnicodeScalarLiteralType = String
//    
// }

// extension SinglePlural: ExpressibleByExtendedGraphemeClusterLiteral where A == Translated<String> {
//    public typealias ExtendedGraphemeClusterLiteralType = String
//    
// }

// extension SinglePlural:ExpressibleByStringLiteral & ExpressibleByStringInterpolation where A == Translated<String> {
//    public init(stringLiteral:String) {
//        self.single = .init(stringLiteral)
//        self.plural = .init(stringLiteral)
//    }
// }

public extension SinglePlural where A == Translated<String> {
    static let empty: Self = .init(single: "", plural: "")
}

extension SinglePlural: Equatable where A: Equatable {}
extension SinglePlural: Hashable where A: Hashable {}
extension SinglePlural: Codable where A: Codable {}
extension SinglePlural: Sendable where A: Sendable {}
