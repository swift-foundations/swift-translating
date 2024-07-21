//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 29/04/2022.
//

import Foundation
import Language
import Translated
import TranslatedString

@dynamicMemberLookup
public struct SinglePlural<A> {
    public let single: A
    public let plural: A
    public var preferred: Variant

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

extension SinglePlural {

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
}

extension SinglePlural {
    public var preferredA: A {
        switch preferred {
        case .single: return single
        case .plural: return plural
        }
    }

    public var enkelvoud: A { single }
    public var meervoud: A { plural }

}

extension SinglePlural {
    public subscript<T>(dynamicMember keyPath: KeyPath<A, T>) -> T {
        switch preferred {
        case .single: return single[keyPath: keyPath]
        case .plural: return plural[keyPath: keyPath]
        }
    }
}
extension SinglePlural {
    public enum Variant: String, Codable, Hashable, Sendable {
        case single
        case plural
    }
}

extension SinglePlural {
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

}

extension SinglePlural {
    public func map<B>(_ transform: (A) -> B) -> SinglePlural<B> {
        return SinglePlural<B>(single: transform(self.single), plural: transform(self.plural))
    }

    public func flatMap<B>(_ transform: (A) -> SinglePlural<B>) -> SinglePlural<B> {
        return SinglePlural<B>(single: transform(self.single).single, plural: transform(self.plural).plural)
    }
}

extension SinglePlural: Equatable where A: Equatable {}
extension SinglePlural: Hashable where A: Hashable {}
extension SinglePlural: Codable where A: Codable {}
extension SinglePlural: Sendable where A: Sendable {}

public extension SinglePlural<TranslatedString> {
    static let empty: Self = .init(single: "", plural: "")
}
