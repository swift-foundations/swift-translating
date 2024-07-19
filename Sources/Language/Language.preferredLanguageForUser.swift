//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 19/06/2020.
//

import Foundation

extension Language {
    public var locale: Locale {
        switch self {
        case .english: return .init(identifier: "US_us")
        case .dutch: return .init(identifier: "NL_nl")
        case .spanish: return .init(identifier: "ES_es")
        case .german: return .init(identifier: "DE_de")
        case .french: return .init(identifier: "FR_fr")
        default:
            print("defaulted language locale of \(self). This requires manual updating")
            return .init(identifier: "US_us")
        }
    }
}

public extension Language {
    static func preferredLanguageForUser() -> Self {

        if let language = Locale.preferredLanguages.first {
            switch language {
            case "en", "en-US", "en-UK": return .english
            case "fr", "fr-FR": return .french
            case "de", "de-DE": return .german
            case "es", "es-ES": return .spanish
            case "nl-NL", "nl": return .dutch
            default: return .english
            }

        } else {
            return .english
        }
    }
}
