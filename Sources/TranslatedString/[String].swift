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

