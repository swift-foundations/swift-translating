//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 11/06/2024.
//

import Foundation
import Language

extension String {
    public static let space: Self = " "
    public static let period: Self = "."
    public static let comma: Self = ","
    public static let semicolon: Self = ";"
    public static let questionmark: Self = "?"
}




extension String {
    public var any: Self {
        if let first = self.first {
            if Set<String>.consonents.contains(String(first)) {return "an \(self)"} else { return "a \(self)" }
        }
        return self
    }
}




extension Set where Element == String {
    public static let consonents: Self = [
        "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"
    ]
}
