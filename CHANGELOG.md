# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.0.1] - 2025-01-25

### Added

#### Core Translation System
- **Translated<A>** generic container for type-safe translations with intelligent fallback chains
- **TranslatedString** specialized string translation type with literal conformance
- **Language** enum supporting 180+ languages with ISO 639-1/639-2 codes
- Intelligent fallback chains based on linguistic and geographical relationships

#### Performance Optimizations
- Lazy evaluation system for fallback chain computation
- Memoization cache for computed fallback results
- Dictionary-first lookup for O(1) direct translations
- 4.5x performance improvement over closure-based initialization

#### Dependency Injection Support
- Swift Dependencies integration for language and locale management
- **@Dependency(\.language)** for current language access
- **@Dependency(\.languages)** for controlling translation scope
- **@Dependency(\.locale)** for locale-aware operations

#### String Operations
- String concatenation operators preserving all language translations
- String literal support: `let text: TranslatedString = "Hello"`
- Dictionary literal support: `let text: TranslatedString = [.english: "Hello"]`
- Parameter-based initialization with clean syntax

#### Plural Forms Support
- **SinglePlural<A>** container for singular/plural form handling
- Dynamic member lookup for convenient property access
- Call-as-function syntax with variant selection
- Functional programming support (map, flatMap)

#### Date Formatting
- **DateFormattedLocalized** extension for automatic date localization
- Translation-aware date formatting across all supported languages
- Integration with Foundation's FormatStyle system

#### Modular Architecture
- Separate modules for different functionality:
  - `Language` - Core language definitions
  - `Translated` - Generic translation container
  - `TranslatedString` - String-specific translations
  - `SinglePlural` - Singular/plural handling
  - `DateFormattedLocalized` - Date formatting
  - `Translating+Dependencies` - Dependency injection
  - `Translating` - Umbrella module

#### Testing Infrastructure
- Swift Testing framework integration
- Comprehensive test suite with dependency isolation
- Performance tests for benchmarking translation efficiency
- Test support for locale-dependent functionality

### Performance
- Implemented lazy evaluation for fallback chains
- Added memoization cache for computed results
- Optimized subscript access with dictionary-first lookup
- Deprecated closure-based initializer with performance warnings

### Documentation
- Comprehensive inline documentation for all public APIs
- Usage examples with code snippets
- Performance guidance and best practices
- DocC integration for excellent developer experience

### Dependencies
- Swift Dependencies (1.9.2+) for dependency injection
- Foundation for core Swift functionality
- Swift 5.10.1+ required

### Supported Platforms
- iOS 16.0+
- macOS 13.0+
- macCatalyst 16.0+
- tvOS 16.0+
- watchOS 9.0+

[0.0.1]: https://github.com/coenttb/swift-translating/releases/tag/0.0.1