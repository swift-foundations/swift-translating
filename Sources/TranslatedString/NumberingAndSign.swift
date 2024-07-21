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


public extension [String] {
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

public enum ListSeparator: String, Hashable {
    case and
    case or
    case individual
}

extension [String] {
    public func numberedAndSigned(for int: Int? = nil, with sign: String = "and") -> Self { numberedAndSigned2(for: self, for: int, with: sign) }
    public func numbered(for int: Int? = nil) -> Self { numbered2(for: self) }

    public func signed(with string: String = "") -> Self {
        return signs(for: self, with: string)
    }

    public func signed(for language: Language, _ andOr: ListSeparator? = .and) -> Self {

        switch andOr {
        case .and:
            return signs(
                for: self,
                with: TranslatedString.and(language)
            )
        case .individual: return signs(for: self, with: "")
        case .none: return self
        case .or:
            return signs(
                for: self,
                with: TranslatedString.or(language)
            )
        }
    }
}

public extension Array where Element == TranslatedString {
    func joined(separator: Array<String>.Separator) -> TranslatedString {
        .init { language in
            self.map{ $0(language) }.joined(separator: separator)(language)
        }
    }
    
    func joined(separator: String) -> TranslatedString {
        .init { language in
            self.map{ $0(language) }.joined(separator: separator)
        }
    }
}

public extension [String] {
    func joined(language: Language, separator: Array<String>.Separator) -> String {
        self.map { TranslatedString($0) }.joined(separator: separator)(language)
    }
}



//        switch self.count {
//        case ...0: return ""
//        case 1: return .init(self.first!)
//        case 2:
//            switch separator {
//            case .and:
//                return .init(
//                    dutch: "\(self.first ?? "") en \(self[1])",
//                    english: "\(self.first ?? "") and \(self[1])"
//                )
//            case .or:
//                return .init(
//                    dutch: "\(self.first ?? "") of \(self[1])",
//                    english: "\(self.first ?? "") or \(self[1])"
//                )
//            case .andOr:
//                return .init(
//                    dutch: "\(self.first ?? "") en/of \(self[1])",
//                    english: "\(self.first ?? "") and/or \(self[1])"
//                )
//            }
//        case 2...:
//            let last = self.last!
//            //            let x = self[0...self.count - 1]
//            let rest = self.dropLast()
//
//            switch separator {
//            case .and: return
//                    .init(
//                        dutch: rest.joined(separator: ", ") + ", en " + "\(last)",
//                        english: rest.joined(separator: ", ") + ", and " + "\(last)"
//                    )
//            case .or: return
//                    .init(
//                        dutch: rest.joined(separator: ", ") + ", of " + "\(last)",
//                        english: rest.joined(separator: ", ") + ", or " + "\(last)"
//                    )
//            case .andOr: return
//                    .init(
//                        dutch: rest.joined(separator: ", ") + ", en/of " + "\(last)",
//                        english: rest.joined(separator: ", ") + ", and/or " + "\(last)"
//                    )
//            }
//        default: fatalError()
//        }
