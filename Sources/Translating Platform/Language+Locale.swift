public import Foundation
import Language

extension Language {

    public var locale: Foundation.Locale {
        Foundation.Locale(identifier: String(describing: self))
    }
}
