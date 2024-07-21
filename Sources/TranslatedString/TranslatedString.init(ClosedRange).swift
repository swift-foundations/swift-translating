//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 21/07/2024.
//

import Foundation

extension TranslatedString {
    public init<Bound>(_ closedRange: ClosedRange<Bound>) where Bound:CustomStringConvertible {
        self = .init(
            dutch: "\(closedRange.lowerBound) tot en met \(closedRange.upperBound)",
            english: "\(closedRange.lowerBound) up to and including \(closedRange.upperBound)"
        )
    }
}

public extension ClosedRange where Bound:CustomStringConvertible {
    func description() -> TranslatedString {
        .init(self)
    }
}
