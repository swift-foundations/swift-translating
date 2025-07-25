# Basic Usage

Common patterns and techniques for using Swift Translating in your applications.

## Creating Translated Strings

### Dictionary Literal Syntax (Recommended)

The most efficient way to create translations using dictionary literal syntax:

```swift
let welcomeMessage: TranslatedString = [
    .dutch: "Welkom bij onze app!",
    .english: "Welcome to our app!",
    .french: "Bienvenue dans notre application!",
    .german: "Willkommen in unserer App!",
    .spanish: "¡Bienvenido a nuestra aplicación!"
]
```

### Parameter-Based Initialization

Clean syntax for specific languages with automatic default selection:

```swift
let notification = TranslatedString(
    "New message",  // Default (used as fallback)
    dutch: "Nieuw bericht",
    english: "New message",
    french: "Nouveau message",
    german: "Neue Nachricht",
    spanish: "Nuevo mensaje"
)
```

### String Literal Support

For simple cases where you just need a default string:

```swift
let simpleMessage: TranslatedString = "Hello World"
// Automatically uses "Hello World" as the English default
```

## Accessing Translations

### Direct Language Access

Get translations for specific languages:

```swift
let greeting: TranslatedString = [
    .english: "Hello",
    .dutch: "Hallo", 
    .french: "Bonjour"
]

// Direct access
let englishGreeting = greeting[.english]  // "Hello"
let dutchGreeting = greeting[.dutch]      // "Hallo" 
let germanGreeting = greeting[.german]    // "Hello" (fallback to English)
```

### Using with Dependency Injection

Automatically use the current language dependency:

```swift
import Dependencies

let greeting: TranslatedString = [
    .english: "Hello",
    .dutch: "Hallo",
    .french: "Bonjour"
]

withDependencies {
    $0.language = .dutch
} operation: {
    print(greeting.description)  // Prints: "Hallo"
}
```

## Intelligent Fallback System

The system automatically provides intelligent fallbacks based on linguistic relationships:

```swift
let text: TranslatedString = [
    .english: "Hello",
    .dutch: "Hallo"
]

// These languages will fallback through the chain:
print(text[.afrikaans])     // "Hallo" (afrikaans → dutch → english)
print(text[.limburgish])    // "Hallo" (limburgish → dutch → english) 
print(text[.chinese])       // "Hello" (chinese → english)
print(text[.french])        // "Hello" (french → english)
```

## Using with SwiftUI

Integrate translations seamlessly with SwiftUI:

```swift
import SwiftUI
import Translating
import Dependencies

struct ContentView: View {
    let title: TranslatedString = [
        .dutch: "Instellingen",
        .english: "Settings",
        .french: "Paramètres",
        .german: "Einstellungen",
        .spanish: "Configuración"
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text(title.description) // Uses current language dependency
                    .font(.largeTitle)
            }
            .navigationTitle(title.description)
        }
    }
}

// Usage with language switching
struct LanguageSettingsView: View {
    @Dependency(\.language) var currentLanguage
    
    var body: some View {
        VStack {
            Button("Switch to Dutch") {
                withDependencies {
                    $0.language = .dutch
                } operation: {
                    // Update UI language
                }
            }
        }
    }
}
```

## Working with Singular/Plural Forms

Handle grammatical number variations using ``SinglePlural``:

```swift
import SinglePlural

let itemCounter = SinglePlural(
    single: TranslatedString([
        .dutch: "item",
        .english: "item",
        .spanish: "artículo"
    ]),
    plural: TranslatedString([
        .dutch: "items", 
        .english: "items",
        .spanish: "artículos"
    ])
)

// Usage based on count
func displayItemCount(_ count: Int) -> String {
    let variant: SinglePlural.Variant = count == 1 ? .single : .plural
    let text = itemCounter(variant)
    
    withDependencies {
        $0.language = .spanish
    } operation: {
        return "\(count) \(text.description)"
        // Returns "1 artículo" or "5 artículos"
    }
}
```

## Date and Time Formatting

Format dates with automatic localization:

```swift
import DateFormattedLocalized
import Foundation

let date = Date()

// Standard formatting (no translation)
let simpleDate = date.formatted(date: .full, time: .short, translated: false)

// Translated formatting (localized for all languages)
let translatedDate = date.formatted(date: .full, time: .short, translated: true)

// Usage with different languages
withDependencies {
    $0.language = .french
} operation: {
    print(translatedDate.description)
    // Prints date in French format: "vendredi 25 janvier 2025 à 14:30"
}

withDependencies {
    $0.language = .german
} operation: {
    print(translatedDate.description)
    // Prints date in German format: "Freitag, 25. Januar 2025 um 14:30"
}
```

## String Concatenation

Combine translated strings while preserving all language translations:

```swift
let greeting: TranslatedString = [
    .english: "Hello",
    .dutch: "Hallo",
    .spanish: "Hola"
]

let name: TranslatedString = [
    .english: " World",
    .dutch: " Wereld", 
    .spanish: " Mundo"
]

// Concatenation preserves all translations
let combined = greeting + name
// Result: [.english: "Hello World", .dutch: "Hallo Wereld", .spanish: "Hola Mundo"]

// Concatenation with regular strings
let withPunctuation = greeting + "!"
// Result: [.english: "Hello!", .dutch: "Hallo!", .spanish: "Hola!"]
```

## Language Switching

Change the active language using dependency injection:

```swift
import Dependencies

// Set language for a specific scope
withDependencies {
    $0.language = .french
} operation: {
    // All translations in this scope will use French
    performUIUpdates()
}

// In a view or service
struct LanguageService {
    @Dependency(\.language) var currentLanguage
    
    func switchLanguage(to newLanguage: Language) {
        // Update language dependency
        withDependencies {
            $0.language = newLanguage
        } operation: {
            // Trigger UI updates or data refresh
        }
    }
}
```

## Performance Best Practices

### Use Dictionary Literals (Preferred)

```swift
// ✅ PREFERRED - Fast dictionary literal
let text: TranslatedString = [
    .english: "Hello",
    .dutch: "Hallo",
    .french: "Bonjour"
]
```

### Avoid Closure-Based Initialization

```swift
// ❌ AVOID - 4.5x slower
let text = TranslatedString { language in
    expensiveTranslationLookup(for: language) // Called 179+ times!
}
```

### Limit Languages for Performance

```swift
// Limit which languages are processed
withDependencies {
    $0.languages = [.english, .dutch, .french]  // Only these 3
} operation: {
    let limitedTranslation = TranslatedString { language in
        // Only called for English, Dutch, and French
        lookupTranslation(for: language)
    }
}
```