//
//  extensions.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

public import Dependencies
public import Language
public import Translated

extension Translated {
    /// Creates a Translated instance using a closure to generate values for each language.
    ///
    /// - Warning: **Performance Warning**: This initializer has significant performance overhead and should be avoided.
    ///
    /// ## Recommended Alternatives:
    ///
    /// **Use dictionary literal syntax instead:**
    /// ```swift
    /// // Preferred - Fast dictionary literal
    /// let translated: Translated<String> = [
    ///     .english: "Hello",
    ///     .dutch: "Hallo",
    ///     .french: "Bonjour"
    /// ]
    /// ```
    ///
    /// - Parameter closure: A function that receives a language and returns the translated value
    @available(
        *,
        deprecated,
        message:
            "Use dictionary literal syntax instead for better performance. This initializer calls the closure for every language in the dependency."
    )
    public init(
        _ closure: (Language) -> A
    ) {
        @Dependency(\.language) var language
        @Dependency(\.languages) var languages

        self = .init(
            default: closure(language),
            dictionary: Dictionary(uniqueKeysWithValues: languages.map { ($0, closure($0)) })
        )
    }
}
