//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 11/06/2024.
//

import Foundation

public extension String {
    static let space: Self = " "
    static let period: Self = "."
    static let comma: Self = ","
    static let semicolon: Self = ";"
    static let questionmark: Self = "?"
}



public extension String {
    static func translated(
        dutch: String? = nil,
        english: String,
        french: String? = nil,
        german: String? = nil,
        spanish: String? = nil,
        language: Languages.Language
    ) -> String {
        Translated<String>(dutch: dutch, english: english, french: french, german: german, spanish: spanish)(language)
    }

    init(
        dutch: String? = nil,
        english: String,
        french: String? = nil,
        german: String? = nil,
        spanish: String? = nil,
        language: Languages.Language
    ) {
        self = Translated<String>(dutch: dutch, english: english, french: french, german: german, spanish: spanish)(language)
    }
}
