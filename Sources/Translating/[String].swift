//
//  File.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Foundation
import Language
import Translated
import TranslatedString

// MARK: - String Array Formatting Extensions

public extension [String] {
    /// Joins strings with localized separator for a specific language
    func joined(language: Language, separator: [String].Separator) -> String {
        self.joined(separator: TranslatedString(separator)(language))
    }
}

public extension [String] {
    /// Joins strings with a translated separator
    func joined(separator: TranslatedString) -> TranslatedString {
        .init { language in
            self.joined(separator: separator(language))
        }
    }
}

public extension [String] {
    /// Creates a grammatically correct joined string with proper separators
    func joined(separator: [String].Separator) -> TranslatedString {
        guard !self.isEmpty else { return "" }
        guard self.count > 1 else { return .init(self[0]) }

        return .init { language in
            let localizedSeparator = TranslatedString(separator)(language)

            if self.count == 2 {
                return "\(self[0]) \(localizedSeparator) \(self[1])"
            }

            // For 3+ items: "A, B, and C"
            let allButLast = Array(self.dropLast())
            let lastItem = self.last!
            return "\(allButLast.joined(separator: ", ")), \(localizedSeparator) \(lastItem)"
        }
    }
}

// MARK: - Dependencies-Based Formatting (requires Dependencies)

extension [String] {
    /// Formats a list with proper grammar and localized separators
    public func formattedList(separator: ListSeparator = .and) -> Translated<Self> {
        .init { _ in
            switch separator {
            case .and:
                return self.formattedItems(with: "and") // TODO: Use proper localized "and"
            case .or:
                return self.formattedItems(with: "or") // TODO: Use proper localized "or"
            case .individual:
                return self.formattedItems(with: "")
            }
        }
    }
}
