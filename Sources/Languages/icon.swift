//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 09/05/2023.
//

import Foundation

public extension Language {
    var icon: String {
        switch self {
        case .dutch: return "🇳🇱"
        case .english: return "🇺🇸"
        case .german: return "🇩🇪"
        case .french: return "🇫🇷"
        case .spanish: return "🇪🇸"
        default: return "nil"
        }
    }
}
