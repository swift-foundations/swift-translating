import Language

public enum ListSeparator: String, Hashable, CaseIterable {
    case and
    case or
    case individual
}

extension [String] {

    public func formattedItems(with sign: String = "and") -> [String] {
        return self.enumerated().map { index, item in
            let trimChars: Set<Character> = [";", ".", ","]
            let trimmedItem = String(
                item.drop(while: { trimChars.contains($0) }).reversed().drop(while: {
                    trimChars.contains($0)
                }).reversed()
            )
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

extension [String] {

    public func withLineBreaks() -> [String] {
        return self.enumerated().map { index, item in
            index + 1 == count ? item : "\(item)\n"
        }
    }
}

extension [String] {

    public func numberedList(startingAt start: Int = 1) -> [String] {
        return self.enumerated().map { index, item in
            "\(start + index).\t\(item)"
        }.withLineBreaks()
    }

    public func numberedAndSigned(
        startingAt start: Int = 1,
        conjunction: String = "and"
    )
        -> [String]
    {
        return
            self
            .numberedList(startingAt: start)
            .formattedItems(with: conjunction)
            .withLineBreaks()
    }
}
