# Getting Started

Learn how to integrate Swift Translating into your project and create your first translations.

## Installation

Add Swift Translating to your project using Swift Package Manager by adding it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-translating.git", from: "0.0.1")
]
```

Or add it through Xcode:
1. File → Add Package Dependencies
2. Enter: `https://github.com/coenttb/swift-translating.git`
3. Select the version or branch you want to use

## Basic Setup

Import the modules you need in your Swift files:

```swift
import Translating  // Imports all modules
// OR import specific modules:
import Language
import Translated
import TranslatedString
```

## Your First Translation

Create a simple translated string:

```swift
import Translating

let greeting = TranslatedString(
    dutch: "Hallo wereld",
    english: "Hello world",
    french: "Bonjour le monde",
    german: "Hallo Welt",
    spanish: "Hola mundo"
)
```

Use it with dependency injection:

```swift
import Dependencies

withDependencies {
    $0.language = .english
} {
    print(greeting) // Prints: "Hello world"
}
```

Or get a translation directly:

```swift
let englishGreeting = greeting(.english)
print(englishGreeting) // Prints: "Hello world"
```

## Next Steps

- Learn about <doc:BasicUsage> patterns
- Explore <doc:AdvancedUsage> features
- Check out the ``Language`` enum for all supported languages