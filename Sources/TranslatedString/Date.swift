//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation
import Language

extension Date {

    public static func placeholder() -> TranslatedString {
        .init(
            dutch: "__ ________________ 2021",
            english: "________________ __, 2021"
        )
    }
    
    public func english(dateStyle: DateFormatter.Style = .long, timeStyle: DateFormatter.Style = .none) -> String {
        return self.description(dateStyle: dateStyle, timeStyle: timeStyle).english
    }

    public func dutch(dateStyle: DateFormatter.Style = .long, timeStyle: DateFormatter.Style = .none) -> String {
        return self.description(dateStyle: dateStyle, timeStyle: timeStyle).dutch
    }


    public func description(dateStyle: DateFormatter.Style = .long, timeStyle: DateFormatter.Style = .none) -> TranslatedString {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle

        return .init { language in
            dateFormatter.locale = language.locale
            return dateFormatter.string(from: self)
        }
    }
}

extension Date?  {
    public func description(dateStyle: DateFormatter.Style = .long, timeStyle: DateFormatter.Style = .none) -> TranslatedString {

        return .init { language in
            switch (dateStyle, timeStyle) {
            case (.none, .none):
                if let date = self {
                    return date.description(dateStyle: dateStyle, timeStyle: timeStyle)(language)
                } else {
                    return Date.placeholder()(language)
                }
            case (.none, _):
                if let date = self {
                    return date.description(dateStyle: dateStyle, timeStyle: timeStyle)(language)
                } else {
                    return "__:__))"
                }
            default:
                if let date = self {
                    return date.description(dateStyle: dateStyle, timeStyle: timeStyle)(language)
                } else {
                    return Date.placeholder()(language)
                }
            }
        }
    }
}
