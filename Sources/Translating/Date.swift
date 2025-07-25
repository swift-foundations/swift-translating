//
//  File.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Dependencies
import Foundation
import Translated
import TranslatedString

extension Date {
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

extension Date? {
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
