//
//  File 3.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation
import Language

extension Translated {
    public func map<B>(_ transform: (A) -> B) -> Translated<B> {
        Translated<B>(
            default: transform(self.default),
            dictionary: self.dictionary.mapValues(transform)
        )
    }

    public func flatMap<B>(_ transform: (A) -> Translated<B>) -> Translated<B> {
        let transformedDefault = transform(self.default)
        var combinedDictionary = transformedDefault.dictionary

        for (_, value) in self.dictionary {
            let transformedValue = transform(value)
            for (innerKey, innerValue) in transformedValue.dictionary {
                combinedDictionary[innerKey] = innerValue
            }
        }

        return Translated<B>(
            default: transformedDefault.default,
            dictionary: combinedDictionary
        )
    }
}

extension Translated {
    public func callAsFunction(language: Language) -> A {
//        self.dictionary[language] ?? self.default
        fatalError()
    }

    public func callAsFunction(with language: Language) -> A {
        callAsFunction(language: language)
    }

    public func callAsFunction(in language: Language) -> A {
        callAsFunction(language: language)
    }

    public func callAsFunction(for language: Language) -> A {
        callAsFunction(language: language)
    }

    public func callAsFunction(_ language: Language) -> A {
        callAsFunction(language: language)
    }
}

extension Sequence {
    public func callAsFunction<A>(language: Language) -> [A] where Element == Translated<A> {
        self.map { $0(language) }
    }

    public func callAsFunction<A>(with language: Language) -> [A] where Element == Translated<A> {
        callAsFunction(language: language)
    }

    public func callAsFunction<A>(in language: Language) -> [A] where Element == Translated<A> {
        callAsFunction(language: language)
    }

    public func callAsFunction<A>(for language: Language) -> [A] where Element == Translated<A> {
        callAsFunction(language: language)
    }

    public func callAsFunction<A>(_ language: Language) -> [A] where Element == Translated<A> {
        callAsFunction(language: language)
    }
}

extension Translated {
    public var engels: A { english }
    public var nederlands: A { dutch }
    public var nl: A { dutch }
}
