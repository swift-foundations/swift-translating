//
//  File.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Foundation
import Language
import Translated

public extension [Language] {
    /// Sorts the array of languages alphabetically by their string representation
    /// - Returns: A new sorted array of languages
    func sort() -> Self {
        self.sorted { language1, language2 in
            "\(language1)" < "\(language2)"
        }
    }
}
