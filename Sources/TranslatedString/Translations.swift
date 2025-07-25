//
//  File.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Foundation

extension String {
    public static let period: Self = "."
    public static let comma: Self = ","
    public static let semicolon: Self = ";"
    public static let questionmark: Self = "?"
    public static let space: Self = "\u{00a0}"
    public static let tab: Self = "\u{0009}"
}

public extension TranslatedString {
    @inlinable static var space: Self {
        .init(String.space)
    }

    @inlinable static var period: Self {
        .init(String.period)
    }

    @inlinable static var comma: Self {
        .init(String.comma)
    }

    @inlinable static var semicolon: Self {
        .init(String.semicolon)
    }

    @inlinable static var questionmark: Self {
        .init(String.questionmark)
    }
}
