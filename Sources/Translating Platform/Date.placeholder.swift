public import Foundation
import Language
public import Translated_String

extension Date {
    public static func placeholder() -> TranslatedString {
        [
            .dutch: "__ ________________ 2021",
            .english: "________________ __, 2021",
        ]
    }
}
