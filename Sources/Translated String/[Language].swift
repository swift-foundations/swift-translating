public import Language
import Translated

extension [Language] {

    public func sort() -> Self {
        self.sorted { language1, language2 in
            "\(language1)" < "\(language2)"
        }
    }
}
