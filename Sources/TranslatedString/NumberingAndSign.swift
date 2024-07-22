import Foundation
import Language

import Foundation
import Language
import Translated

extension [String] {
    public static func formattedItems(for items: [String], with sign: String = "and") -> [String] {
        return items.enumerated().map { (index, item) in
            String.formatted(item, index: index, count: items.count, with: sign)
        }
    }
    
    public func formattedItems(with sign: String = "and") -> [String] {
        Self.formattedItems(for: self, with: sign)
    }
}

extension String {
    public static func formatted(_ string: String, index: Int, count: Int, with sign: String = "and") -> String {
        let trimmedString = string.trimmingCharacters(in: [";", ".", ","])
        switch index {
        case count - 1:
            return "\(trimmedString)."
        case count - 2:
            return "\(trimmedString); \(sign)"
        default:
            return "\(trimmedString);"
        }
    }
}

extension String {
    static func linebreaker(for string: String, index: Int, count: Int) -> String {
        index + 1 == count ? string : "\(string)\n"
    }
}

extension [String] {
    static func linebreaker(for items: [String]) -> [String] {
        return items.enumerated().map { (index, item) in
            String.linebreaker(for: item, index: index, count: items.count)
        }
    }
    
    func linebreaker() -> [String] {
        [String].linebreaker(for: self)
    }
    
}

extension [String] {
    static func formattedWithNumbers(for items: [String], start: Int = 1) -> Self {
        return items.enumerated().map { index, item in
                .formattedWithNumbers(for: item, start: start, index: index)
        }
    }
    
    public func formattedWithNumbers(start: Int = 1) -> Self {
        return [String].formattedWithNumbers(for: self, start: start).linebreaker()
    }
}

extension String {
    static func formattedWithNumbers(for string: String, start: Int = 1, index: Int) -> Self {
        "\(start + index).\t\(string)"
    }
}

extension [String] {
    public static func numberedAndSigned(for items: [String], start: Int = 1, with sign: String = "and") -> Self {
        let numbered = [String].formattedWithNumbers(for: items, start: start)
        let formatted = [String].formattedItems(for: numbered, with: sign)
        return linebreaker(for: formatted)
    }
    
    func numberedAndSigned() -> Self {
        return [String].numberedAndSigned(for: self)
    }
}

public extension [TranslatedString] {
    func joined(separator: [String].Separator) -> TranslatedString {
        .init { language in
            self.map { $0(language) }.joined(separator: separator)(language)
        }
    }
    
    func joined(separator: String) -> TranslatedString {
        .init { language in
            self.map { $0(language) }.joined(separator: separator)
        }
    }
}

public extension [String] {
    func joined(language: Language, separator: [String].Separator) -> String {
        return self.map { TranslatedString($0) }.joined(separator: separator)(language)
    }
}

public enum ListSeparator: String, Hashable {
    case and
    case or
    case individual
}

extension [String] {
    public func signed(separator: ListSeparator? = .and) -> Translated<Self> {
        .init { language in
            switch separator {
            case .and:
                return self.formattedItems(with: TranslatedString.and(language))
            case .or:
                return self.formattedItems(with: TranslatedString.or(language))
            case .individual:
                return self.formattedItems(with: "")
            case .none:
                return self
            }
        }
    }
}

extension [String] {
    @available(*, deprecated, message: "Renamed to signed(separator: ListSeparator?) -> Translated<[String]>")
    public func signed(for language: Language, _ separator: ListSeparator? = .and) -> Self {
        switch separator {
        case .and:
            return self.formattedItems(with: TranslatedString.and(language))
        case .or:
            return self.formattedItems(with: TranslatedString.or(language))
        case .individual:
            return self.formattedItems(with: "")
        case .none:
            return self
        }
    }
}


//import Foundation
//import Language
//
//func signs(for items: [String]) -> [String] {
//
//    var container: [String] = []
//
//    for (index, item) in items.reversed().enumerated() {
//        switch index {
//
//        case 0: container.append("\(item.period)")
//        case 1: container.append("\(item); and")
//        case 2..<items.count: container.append("\(item);")
//
//        default: break
//        }
//    }
//    return container.reversed().map { "\($0)" }
//}
//
//func linebreaker(for items: [String]) -> [String] {
//
//    var container: [String] = []
//
//    for (index, item) in items.enumerated() {
//        switch index {
//
//        case _ where index + 1 == items.count: container.append("\(item)")
//        default: container.append("\(item)\n")
//        }
//    }
//    return container.map { "\($0)" }
//
//}
//
//func numbering(for items: [String]) -> [String] {
//
//    var container: [String] = []
//
//    for (index, item) in items.enumerated() {
//        container.append("\(index + 1).\t\(item)")
//    }
//    return container.map { "\($0)" }
//}
//
//
//public extension [String] {
//     func numberedAndSigned() -> Self {
//        return numberedAndSigned(for: self)
//    }
//}
//
//extension [String] {
//    public func numberedAndSigned(for items: [String]) -> Self {
//        let numbered = numbering(for: items.map { $0 })
//        let signed = signs(for: numbered)
//        let linebreak = linebreaker(for: signed)
//        return linebreak
//    }
//}
//
//func signs(for items: [String], with sign: String = "and") -> [String] {
//
//    var container: [String] = []
//
//    for (index, item) in items.reversed().enumerated() {
//        switch index {
//        case 0: container.append("\(item.period)")
//        case 1: container.append("\(item.trimmingCharacters(in: [";", ".", ","])); \(sign)")
//        case 2..<items.count: container.append("\(item.trimmingCharacters(in: [";", ".", ","]));")
//        default: break
//        }
//    }
//    return container.reversed().map { "\($0)" }
//}
//
//extension Array where Element: Hashable {
//    public var set: Set<Element> {
//        Set<Element>(self)
//    }
//}
//
//func numbering(for items: [String], for int: Int? = nil) -> [String] {
//
//    var container: [String] = []
//
//    for (index, item) in items.enumerated() {
//        container.append("\(int != nil ? "\(int!)." : "")\(index + 1).\t\(item)")
//    }
//    return container.map { "\($0)" }
//}
//
//public func numberedAndSigned(for items: [String], with sign: String = "and") -> [String] {
//    let numbered = numbering(for: items.map { $0 })
//    let signed = signs(for: numbered, with: sign)
//    let linebreak = linebreaker(for: signed)
//    return linebreak
//}
//
//private func numberedAndSigned2(for items: [String], for int: Int? = nil, with sign: String = "and") -> [String] {
//    let numbered = numbering(for: items.map { $0 }, for: int)
//    let signed = signs(for: numbered, with: sign)
//    let linebreak = linebreaker(for: signed)
//    return linebreak
//}
//
//public func numbered2(for items: [String], for int: Int? = nil) -> [String] {
//    let numbered = numbering(for: items.map { $0 }, for: int)
//    let linebreak = linebreaker(for: numbered)
//    return linebreak
//}
//
//public enum ListSeparator: String, Hashable {
//    case and
//    case or
//    case individual
//}
//
//extension [String] {
//    public func numberedAndSigned(for int: Int? = nil, with sign: String = "and") -> Self { numberedAndSigned2(for: self, for: int, with: sign) }
//    public func numbered(for int: Int? = nil) -> Self { numbered2(for: self) }
//
//    public func signed(with string: String = "") -> Self {
//        return signs(for: self, with: string)
//    }
//
//    public func signed(for language: Language, _ andOr: ListSeparator? = .and) -> Self {
//
//        switch andOr {
//        case .and:
//            return signs(
//                for: self,
//                with: TranslatedString.and(language)
//            )
//        case .individual: return signs(for: self, with: "")
//        case .none: return self
//        case .or:
//            return signs(
//                for: self,
//                with: TranslatedString.or(language)
//            )
//        }
//    }
//}
//
//public extension Array where Element == TranslatedString {
//    func joined(separator: Array<String>.Separator) -> TranslatedString {
//        .init { language in
//            self.map{ $0(language) }.joined(separator: separator)(language)
//        }
//    }
//
//    func joined(separator: String) -> TranslatedString {
//        .init { language in
//            self.map{ $0(language) }.joined(separator: separator)
//        }
//    }
//}
//
//public extension [String] {
//    func joined(language: Language, separator: Array<String>.Separator) -> String {
//        self.map { TranslatedString($0) }.joined(separator: separator)(language)
//    }
//}



