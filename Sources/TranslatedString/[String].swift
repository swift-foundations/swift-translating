//
//  File 2.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 24/11/2020.
//

import Foundation
import Language

public extension [String] {
    
    static let alphabet: Self = [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" ]
    
    enum Separator {
        case and
        case or
        case andOr
        
        public static let orSeparator: Self = .or
    }
}

public extension [String] {
    func joined(separator: TranslatedString) -> TranslatedString {
        .init { language in
            self.joined(separator: separator(language))
        }
    }
    
}

extension TranslatedString {
    public init(_ separator: [String].Separator){
        fatalError()
    }
}

public extension [String] {
    func joined(separator: Separator) -> TranslatedString {
        switch self.count {
        case 0: return ""
        case 1: return .init(self[0])
        case 2:
            return .init { language in
                "\(self[0]) \(TranslatedString(separator)(language)) \(self[1])"
            }
        default:
            let rest = self.dropLast().joined(separator: ", ")
            let last = self.last!
            return .init { language in
                "\(rest), \(TranslatedString(separator)(language)) \(last)"
            }
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
