import Foundation
import Language


public func signs(for items: [String]) -> [String] {

    var container: [String] = []

    for (index, item) in items.reversed().enumerated() {
        switch index {

        case 0: container.append("\(item.period)")
        case 1: container.append("\(item); and")
        case 2..<items.count: container.append("\(item);")

        default: break
        }
    }
    return container.reversed().map { "\($0)" }
}

public func linebreaker(for items: [String]) -> [String] {

    var container: [String] = []

    for (index, item) in items.enumerated() {
        switch index {

        case _ where index + 1 == items.count: container.append("\(item)")
        default: container.append("\(item)\n")
        }
    }
    return container.map { "\($0)" }

}

public func numbering(for items: [String]) -> [String] {

    var container: [String] = []

    for (index, item) in items.enumerated() {
        container.append("\(index + 1).\t\(item)")
    }
    return container.map { "\($0)" }
}

public protocol HasDateStyle {
    var timeStyle: DateFormatter.Style { get }
    var dateStyle: DateFormatter.Style { get }
    var locale: Locale { get }
}

public extension HasDateStyle {
    var timeStyle: DateFormatter.Style { .none }
    var dateStyle: DateFormatter.Style { .long }
//    var locale:Locale { .autoupdatingCurrent }
}

// public extension Optional where Wrapped == Date {
//    func description<Environment:HasDateStyle>(environment:Environment)->String {
//        if let unwrapped = self {
//            return unwrapped.description(environment: environment)
//        } else {
//            return "____________________"
//        }
//    }
// }

public extension Array where Element == String {
     func numberedAndSigned() -> Self {
        return numberedAndSigned(for: self)
    }
}

extension [String] {
    public func numberedAndSigned(for items: [String]) -> Self {
        let numbered = numbering(for: items.map { $0 })
        let signed = signs(for: numbered)
        let linebreak = linebreaker(for: signed)
        return linebreak
    }
}



public func signs(for items: [String], with sign: String = "and") -> [String] {

    var container: [String] = []

    for (index, item) in items.reversed().enumerated() {
        switch index {
        case 0: container.append("\(item.period)")
        case 1: container.append("\(item.trimmingCharacters(in: [";", ".", ","])); \(sign)")
        case 2..<items.count: container.append("\(item.trimmingCharacters(in: [";", ".", ","]));")
        default: break
        }
    }
    return container.reversed().map { "\($0)" }
}

extension Array where Element: Hashable {
    public var set: Set<Element> {
        Set<Element>(self)
    }
}

public func numbering(for items: [String], for int: Int? = nil) -> [String] {

    var container: [String] = []

    for (index, item) in items.enumerated() {
        container.append("\(int != nil ? "\(int!)." : "")\(index + 1).\t\(item)")
    }
    return container.map { "\($0)" }
}

public func numberedAndSigned(for items: [String], with sign: String = "and") -> [String] {
    let numbered = numbering(for: items.map { $0 })
    let signed = signs(for: numbered, with: sign)
    let linebreak = linebreaker(for: signed)
    return linebreak
}

private func numberedAndSigned2(for items: [String], for int: Int? = nil, with sign: String = "and") -> [String] {
    let numbered = numbering(for: items.map { $0 }, for: int)
    let signed = signs(for: numbered, with: sign)
    let linebreak = linebreaker(for: signed)
    return linebreak
}

public func numbered2(for items: [String], for int: Int? = nil) -> [String] {
    let numbered = numbering(for: items.map { $0 }, for: int)
    let linebreak = linebreaker(for: numbered)
    return linebreak
}

public enum List: String, Hashable {
    case and
    case or
    case individual
}

extension Array where Element == String {
    public func numberedAndSigned(for int: Int? = nil, with sign: String = "and") -> Self { numberedAndSigned2(for: self, for: int, with: sign) }
    public func numbered(for int: Int? = nil) -> Self { numbered2(for: self) }

    public func signed(with string: String = "") -> Self {
        return signs(for: self, with: string)
    }

    public func signed(for language: Language, _ andOr: List? = .and) -> Self {

        switch andOr {
        case .and:
            return signs(
                for: self,
                with: language(
                    dutch: "en",
                    english: "and",
                    french: "et",
                    german: "und",
                    italian: "e",
                    spanish: "y"
                )
            )
        case .individual: return signs(for: self, with: "")
        case .none: return self
        case .or:
            return signs(
                for: self,
                with: language(
                    dutch: "of",
                    english: "or",
                    french: "ou",
                    german: "oder",
                    italian: "o",
                    spanish: "o"
                )
            )
        }
    }
}

//                string(
//                for: language,
//                dutch: {
//                    switch andOr {
//                    case .and: return "en"
//                    case .or: return "of"
//                    case .individual: return ""
//                    }
//                }(),
//                english: {
//                    switch andOr {
//                    case .and: return "and"
//                    case .or: return "or"
//                    case .individual: return ""
//                    }
//                }()
//            )

public func memoize<T: Hashable, U>(work: @escaping ((T) -> U, T) -> U) -> (T) -> U {
    var memo = [T: U]()

    func wrap(x: T) -> U {
        if let q = memo[x] { return q }
        let r = work(wrap, x)
        memo[x] = r
        return r
    }

    return wrap
}

public func memoize<T: Hashable, U>(work: @escaping (T) -> U) -> (T) -> U {
    var memo = [T: U]()

    return { x in
        if let q = memo[x] { return q }
        let r = work(x)
        memo[x] = r
        return r
    }
}

@dynamicMemberLookup
public struct CoW<T> {
    public init(_ value: T) {
        _storage = Storage(value)
    }
    public subscript<V>(dynamicMember keyPath: WritableKeyPath<T, V>) -> V {
        get { value[keyPath: keyPath] }
        set { value[keyPath: keyPath] = newValue }
    }
    public var value: T {
        get {
            return _storage.value
        }
        set {
            if isKnownUniquelyReferenced(&_storage) {
                _storage.value = value
            } else {
                _storage = Storage(newValue)
            }
        }
    }

    private var _storage: Storage

    private class Storage {
        var value: T
        init(_ value: T) {
            self.value = value
        }
    }
}

extension CoW: Equatable where T: Equatable {
    public static func == (lhs: CoW<T>, rhs: CoW<T>) -> Bool {
        return lhs.value == rhs.value
    }
}
