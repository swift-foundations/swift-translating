# swift-translating

A comprehensive Swift package providing cross-platform internationalization and localization support with type-safe language handling, intelligent fallbacks, and seamless dependency injection.

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

This package is currently in active development and is subject to frequent changes. Features and APIs may change without prior notice until a stable release is available.

## Features

- **Comprehensive Language Support**: 180+ languages with ISO 639-1/639-2 codes
- **Intelligent Fallback Chains**: Automatic fallbacks based on linguistic relationships
- **Type-Safe API**: Compile-time safety for language handling and translations
- **Performance Optimized**: Lazy evaluation and caching for efficient translations
- **Dependency Injection**: Seamless integration with Swift Dependencies
- **Flexible Translation System**: Dictionary literals, parameter-based, and closure-based initialization
- **Localized Date Formatting**: Automatic date formatting per language/locale
- **Plural Forms Support**: Handle singular/plural variations intelligently  
- **String Operations**: Concatenation, manipulation with translation preservation
- **Modular Architecture**: Use only the components you need
- **Swift Testing Integration**: Built-in testing support with proper dependency isolation

## Installation

Add this package to your project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-translating.git", from: "0.0.1")
]
```

## Usage

### Basic Translation

```swift
import Translating
import Dependencies

let greeting = TranslatedString(
    dutch: "Hallo",
    english: "Hello",
    french: "Bonjour",
    german: "Hallo",
    spanish: "Hola"
)

// Using dependency injection
withDependencies {
    $0.language = .english
} operation: {
    print(greeting.description) // "Hello"
}

withDependencies {
    $0.language = .dutch  
} operation: {
    print(greeting.description) // "Hallo"
}

// Direct language access
let dutchGreeting = greeting[.dutch]     // "Hallo"
let germanGreeting = greeting[.german]   // "Hallo"
let koreanGreeting = greeting[.korean]   // "Hello" (fallback to English)
```

### Dictionary Literal Syntax

The most efficient way to create translations:

```swift
let welcome: TranslatedString = [
    .english: "Welcome",
    .dutch: "Welkom", 
    .french: "Bienvenue",
    .spanish: "Bienvenido"
]
```

### String Literal Support

For simple cases:

```swift
let message: TranslatedString = "Hello World" // Uses English as default
```

### Intelligent Fallbacks

Languages automatically fall back based on linguistic relationships:

```swift
let text: TranslatedString = [
    .english: "Hello",
    .dutch: "Hallo"
]

// These languages fallback to Dutch, then English
print(text[.afrikaans])     // "Hallo" (afrikaans → dutch → english)
print(text[.limburgish])    // "Hallo" (limburgish → dutch → english)
print(text[.chinese])       // "Hello" (chinese → english)
```

### Parameter-Based Initialization

Clean syntax for specific languages:

```swift
let notification = TranslatedString(
    "New message",          // Default
    dutch: "Nieuw bericht",
    french: "Nouveau message",
    german: "Neue Nachricht"
)
```

### Singular/Plural Forms

Handle grammatical number variations:

```swift
import SinglePlural

let itemCount = SinglePlural(
    single: TranslatedString(english: "1 item", dutch: "1 item"),
    plural: TranslatedString(english: "items", dutch: "items")
)

let message = itemCount(.single)  // Uses singular form
let message = itemCount(.plural)  // Uses plural form
```

### Date Formatting

Automatic localization for dates:

```swift
import DateFormattedLocalized

let date = Date()
let formattedDate = date.formatted(
    date: .full, 
    time: .short, 
    translated: true
)
// Creates TranslatedString with localized date formats for all languages
```

### Type-Safe Generic Translation

Works with any type, not just strings:

```swift
let prices: Translated<Double> = [
    .english: 9.99,
    .dutch: 8.99,
    .french: 10.99
]

let currentPrice = prices[.dutch] // 8.99
```

## Architecture

Swift Translating is built with a modular architecture. You can import only the components you need:

```swift
// Core language support
import Language

// Translation system
import Translated
import TranslatedString  

// Dependency injection support
import Translating_Dependencies

// Singular/plural handling
import SinglePlural

// Localized date formatting
import DateFormattedLocalized

// Everything together
import Translating
```

### Core Components

- **`Language`**: Enum with 180+ language codes and locale mapping
- **`Translated<A>`**: Generic container for translated values with intelligent fallbacks
- **`TranslatedString`**: Specialized `Translated<String>` with additional string operations
- **`SinglePlural<A>`**: Container for singular/plural form handling
- **`DateFormattedLocalized`**: Date formatting with translation support

## Performance

The package is optimized for performance:

- **Lazy evaluation**: Fallback chains computed only when needed
- **Caching**: Memoization of computed fallback results  
- **Dictionary-first lookup**: O(1) direct translations
- **Avoiding closure overhead**: Dictionary literals preferred over closure-based initialization

⚠️ **Performance Tip**: Use dictionary literal syntax instead of closure-based initialization for optimal performance.

```swift
// ✅ PREFERRED - Fast
let text: TranslatedString = [.english: "Hello", .dutch: "Hallo"]

// ❌ AVOID - 4.5x slower
let text = TranslatedString { language in lookupTranslation(for: language) }
```

## Feedback is Much Appreciated!
  
If you’re working on your own Swift web project, feel free to learn, fork, and contribute.

Got thoughts? Found something you love? Something you hate? Let me know! Your feedback helps make this project better for everyone. Open an issue or start a discussion—I’m all ears.

> [Subscribe to my newsletter](http://coenttb.com/en/newsletter/subscribe)
>
> [Follow me on X](http://x.com/coenttb)
> 
> [Link on Linkedin](https://www.linkedin.com/in/tenthijeboonkkamp)

## License

This project is licensed by coenttb under the **Apache 2.0 License**.  
See [LICENSE](LICENSE.md) for details.
