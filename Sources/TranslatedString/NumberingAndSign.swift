import Foundation
import Language

// MARK: - List Separator Enum

public enum ListSeparator: String, Hashable, CaseIterable {
    case and
    case or
    case individual
}

// MARK: - String Array List Formatting

extension [String] {
    /// Formats items with proper punctuation and conjunctions
    public func formattedItems(with sign: String = "and") -> [String] {
        return self.enumerated().map { index, item in
            let trimmedItem = item.trimmingCharacters(in: [";", ".", ","])
            switch index {
            case count - 1:
                return "\(trimmedItem)."
            case count - 2:
                return "\(trimmedItem); \(sign)"
            default:
                return "\(trimmedItem);"
            }
        }
    }
}

// MARK: - Line Breaking Utilities

extension [String] {
    /// Adds line breaks to all items except the last one
    public func withLineBreaks() -> [String] {
        return self.enumerated().map { index, item in
            index + 1 == count ? item : "\(item)\n"
        }
    }
}

// MARK: - Numbered List Formatting

extension [String] {
    /// Formats strings as a numbered list starting from the specified number
    public func numberedList(startingAt start: Int = 1) -> [String] {
        return self.enumerated().map { index, item in
            "\(start + index).\t\(item)"
        }.withLineBreaks()
    }

    /// Creates a comprehensive numbered and signed list with proper formatting
    public func numberedAndSigned(startingAt start: Int = 1, conjunction: String = "and") -> [String] {
        return self
            .numberedList(startingAt: start)
            .formattedItems(with: conjunction)
            .withLineBreaks()
    }
}
