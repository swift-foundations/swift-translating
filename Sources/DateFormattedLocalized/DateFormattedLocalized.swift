//
//  File.swift
//  swift-language
//
//  Created by Coen ten Thije Boonkkamp on 06/12/2024.
//

import Dependencies
import Foundation
import TranslatedString
import Translating_Dependencies

extension Date {
    /// Formats a date with optional translation support across multiple languages.
    ///
    /// This method extends the standard date formatting to support internationalization by creating
    /// a TranslatedString that contains properly localized date representations for different languages.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// let date = Date()
    /// 
    /// // Standard formatting (no translation)
    /// let simple = date.formatted(date: .full, time: .short, translated: false)
    /// 
    /// // Translated formatting (localized for all supported languages)
    /// let translated = date.formatted(date: .full, time: .short, translated: true)
    /// ```
    ///
    /// When `translated` is `true`, the method creates a TranslatedString where each language
    /// gets the date formatted according to its locale conventions. This ensures proper
    /// localization of month names, day names, and date ordering.
    ///
    /// - Parameters:
    ///   - date: The date style to use for formatting
    ///   - time: The time style to use for formatting
    ///   - translated: Whether to create translated versions for all languages (if true) or use current locale only (if false/nil)
    /// - Returns: A TranslatedString containing the formatted date, with proper localization if translated=true
    public func formatted(date: FormatStyle.DateStyle, time: FormatStyle.TimeStyle, translated: Bool?) -> TranslatedString {

        guard translated == true else { return TranslatedString(self.formatted(date: date, time: time)) }

        return TranslatedString { language in
            let format = Date.FormatStyle(
                date: date,
                time: time,
                locale: language.locale
            )

            return self.formatted(format)
        }
    }
}
