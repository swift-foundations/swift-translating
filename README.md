# swift-translating

[![CI](https://github.com/coenttb/swift-translating/workflows/CI/badge.svg)](https://github.com/coenttb/swift-translating/actions/workflows/ci.yml)
![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

A cross-platform Swift package for internationalization and localization with type-safe language handling, intelligent fallback chains, and dependency injection integration.

## Overview

swift-translating provides internationalization and localization for Swift applications with support for 180+ languages, automatic linguistic fallbacks, and integration with Swift Dependencies. The package includes components for translated strings, date formatting, singular/plural forms, and generic translated value containers.

## Features

- 180+ language support with ISO 639-1/639-2 codes and locale mapping
- Intelligent fallback chains based on linguistic and geographical relationships
- Type-safe translation API with compile-time guarantees
- Dictionary literal, parameter-based, and closure-based initialization patterns
- Integration with Swift Dependencies for automatic language resolution
- Localized date and time formatting across all languages
- Singular/plural form handling for grammatical number variations
- String concatenation and manipulation with translation preservation
- Generic `Translated<A>` container supporting any type
- Modular architecture allowing selective component import
- Performance optimizations including lazy evaluation and caching

## Installation

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-translating.git", from: "0.0.1")
]
```

## Quick Start

```swift
import Translating
import Dependencies

// Create translated content
let greeting: TranslatedString = [
    .english: "Hello",
    .dutch: "Hallo",
    .french: "Bonjour"
]

// Use with dependency injection
withDependencies {
    $0.language = .dutch
} operation: {
    print(greeting.description) // "Hallo"
}

// Direct language access
let englishGreeting = greeting[.english] // "Hello"
let koreanGreeting = greeting[.korean]   // "Hello" (fallback)
```

## Usage Examples

### Translation Creation

**Dictionary literal syntax (recommended for performance):**

```swift
let welcome: TranslatedString = [
    .english: "Welcome",
    .dutch: "Welkom",
    .french: "Bienvenue",
    .spanish: "Bienvenido"
]
```

**Parameter-based initialization:**

```swift
let notification = TranslatedString(
    "New message",              // Default value
    dutch: "Nieuw bericht",
    french: "Nouveau message",
    german: "Neue Nachricht"
)
```

**String literal for simple cases:**

```swift
let message: TranslatedString = "Hello World"
```

### Language Fallback System

Automatic fallbacks follow linguistic relationships:

```swift
let text: TranslatedString = [
    .english: "Hello",
    .dutch: "Hallo"
]

print(text[.afrikaans])    // "Hallo" (afrikaans → dutch → english)
print(text[.limburgish])   // "Hallo" (limburgish → dutch → english)
print(text[.chinese])      // "Hello" (chinese → english)
```

Each language has a predefined fallback chain. For example:
- Afrikaans → Dutch → English → default
- Basque → Spanish → French → English → default
- Finnish → Swedish → English → default

### Dependency Injection

Integration with Swift Dependencies for automatic language resolution:

```swift
import Dependencies

@Dependency(\.language) var currentLanguage

withDependencies {
    $0.language = .french
} operation: {
    // All TranslatedString.description calls use French
    print(greeting.description) // Uses French translation
}
```

### Singular/Plural Forms

Handle grammatical number variations:

```swift
import SinglePlural

let itemLabel = SinglePlural(
    single: TranslatedString([.english: "item", .dutch: "item"]),
    plural: TranslatedString([.english: "items", .dutch: "items"])
)

let singleMessage = itemLabel(.single)  // Returns TranslatedString for "item"
let pluralMessage = itemLabel(.plural)  // Returns TranslatedString for "items"
```

### Localized Date Formatting

Automatic date formatting for all languages:

```swift
import DateFormattedLocalized

let date = Date()
let formatted = date.formatted(
    date: .complete,
    time: .shortened,
    translated: true
)
// Creates TranslatedString with localized formats for all languages
```

### Generic Translation Container

`Translated<A>` works with any type:

```swift
let prices: Translated<Double> = [
    .english: 9.99,
    .dutch: 8.99,
    .french: 10.99
]

let dutchPrice = prices[.dutch]  // 8.99

let settings: Translated<Bool> = [
    .english: true,
    .dutch: false
]
```

### String Operations

Translation-preserving string operations:

```swift
let greeting: TranslatedString = [.english: "hello", .dutch: "hallo"]
let capitalized = greeting.capitalized
// capitalized.english == "Hello"
// capitalized.dutch == "Hallo"

let withPunctuation = greeting.period
// withPunctuation.english == "hello."
// withPunctuation.dutch == "hallo."

// Concatenation
let prefix: TranslatedString = [.english: "Good ", .dutch: "Goeie "]
let time: TranslatedString = [.english: "morning", .dutch: "morgen"]
let combined = prefix + time
// combined.english == "Good morning"
// combined.dutch == "Goeie morgen"
```

## Module Architecture

The package is modular - import only what you need:

```swift
// Core language support
import Language                 // Language enum with 180+ codes

// Translation system
import Translated              // Generic Translated<A> container
import TranslatedString        // Specialized string translations

// Dependency injection
import Translating_Dependencies // Swift Dependencies integration

// Additional features
import SinglePlural            // Singular/plural form handling
import DateFormattedLocalized  // Localized date formatting

// All components
import Translating
```

### Core Components

- **`Language`**: Enum with 180+ ISO 639-1/639-2 language codes and locale conversion
- **`Translated<A>`**: Generic container for translated values with intelligent fallback system
- **`TranslatedString`**: Type alias for `Translated<String>` with additional string operations
- **`SinglePlural<A>`**: Container for managing singular and plural forms
- **`DateFormattedLocalized`**: Extension for creating localized date/time formatted strings

## Performance Characteristics

- **Dictionary lookups**: O(1) direct translation access
- **Lazy evaluation**: Fallback chains computed only when needed
- **Memoization**: Computed fallback results cached
- **Dictionary vs closure initialization**: Dictionary literals are 4.5x faster

**Performance recommendation:**

```swift
// ✅ Preferred - Fast dictionary literal
let text: TranslatedString = [
    .english: "Hello",
    .dutch: "Hallo"
]

// ❌ Avoid - Closure called for every language in dependency
let text = TranslatedString { language in
    expensiveTranslationLookup(for: language)  // Called 180+ times
}
```

## Related Packages

### Used By

This package is used by many packages across the ecosystem, including:

- [coenttb-com-server](https://github.com/coenttb/coenttb-com-server): Production server for coenttb.com built with Boiler.
- [coenttb-com-shared](https://github.com/coenttb/coenttb-com-shared): A Swift package with shared models for coenttb.com applications.
- [coenttb-server](https://github.com/coenttb/coenttb-server): A Swift package for building fast, modern, and safe servers.
- [coenttb-ui](https://github.com/coenttb/coenttb-ui): A Swift package with UI components for coenttb applications.
- [coenttb-web](https://github.com/coenttb/coenttb-web): A Swift package with tools for web development building on swift-web.
- [pointfree-html-translating](https://github.com/coenttb/pointfree-html-translating): A Swift package integrating pointfree-html with swift-translating.
- [swift-document-templates](https://github.com/coenttb/swift-document-templates): A Swift package for data-driven business document creation.
- [swift-html](https://github.com/coenttb/swift-html): The Swift library for domain-accurate and type-safe HTML & CSS.
- [swift-money](https://github.com/coenttb/swift-money): A Swift package with foundational types for currency and monetary calculations.
- [swift-password-validation](https://github.com/coenttb/swift-password-validation): A Swift package for type-safe password validation.

*And 2 other packages in the ecosystem*

### Third-Party Dependencies

- [pointfreeco/swift-dependencies](https://github.com/pointfreeco/swift-dependencies): A dependency management library for controlling dependencies in Swift.

## License

This package is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.

## Contributing

Contributions are welcome. Please open an issue to discuss proposed changes before submitting a pull request.
