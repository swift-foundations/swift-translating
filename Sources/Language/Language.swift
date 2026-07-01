public import BCP_47

/// A language tag conforming to BCP 47 / RFC 5646.
///
/// `Language` is a typealias for `BCP47.LanguageTag`, providing type-safe language
/// identification for internationalization and localization.
///
/// Static convenience accessors for all ISO 639-1 language codes are available:
///
/// ```swift
/// let userLanguage: Language = .english
/// let tag = Language.french
/// ```
public typealias Language = BCP47.LanguageTag
