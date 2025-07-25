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
        [
            .dutch: "__ ________________ 2021",
            .english: "________________ __, 2021"
        ]
    }
}
