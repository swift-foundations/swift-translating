# Migration Guide

Instructions for migrating from other internationalization solutions to Swift Translating.

## From Foundation's NSLocalizedString

Replace NSLocalizedString calls with TranslatedString:

### Before
```swift
let greeting = NSLocalizedString("greeting", comment: "User greeting")
```

### After
```swift
let greeting = TranslatedString(
    dutch: "Hallo",
    english: "Hello",
    french: "Bonjour",
    german: "Hallo",
    spanish: "Hola"
)
```

## From String Catalogs

Convert .xcstrings files to TranslatedString definitions:

### Before (.xcstrings)
```json
{
  "sourceLanguage": "en",
  "strings": {
    "Hello": {
      "localizations": {
        "en": { "stringUnit": { "state": "translated", "value": "Hello" }},
        "es": { "stringUnit": { "state": "translated", "value": "Hola" }},
        "fr": { "stringUnit": { "state": "translated", "value": "Bonjour" }}
      }
    }
  }
}
```

### After
```swift
let hello = TranslatedString(
    english: "Hello",
    spanish: "Hola", 
    french: "Bonjour"
)
```

## From SwiftUI LocalizedStringKey  

Replace LocalizedStringKey with TranslatedString:

### Before
```swift
struct ContentView: View {
    var body: some View {
        Text("welcome_message")
    }
}
```

### After
```swift
struct ContentView: View {
    let welcomeMessage = TranslatedString(
        dutch: "Welkom",
        english: "Welcome",
        french: "Bienvenue"
    )
    
    var body: some View {
        Text(welcomeMessage.description)
    }
}
```

## From Manual Locale Handling

Replace manual locale switching with dependency injection:

### Before
```swift
class LanguageManager {
    static var currentLocale = Locale.current
    
    static func setLanguage(_ languageCode: String) {
        currentLocale = Locale(identifier: languageCode)
    }
}
```

### After
```swift
import Dependencies

// Set language dependency
withDependencies {
    $0.language = .french
} {
    // All translations use French automatically
}
```

## Migration Checklist

- [ ] Replace NSLocalizedString calls with TranslatedString
- [ ] Convert .strings/.xcstrings files to Swift code
- [ ] Update SwiftUI Views to use TranslatedString
- [ ] Replace manual locale management with Language dependency
- [ ] Add fallback languages for incomplete translations
- [ ] Update tests to use dependency injection for language switching
- [ ] Consider using SinglePlural for count-dependent strings

## Common Pitfalls

### Forgetting Fallbacks
Always provide fallback translations:
```swift
// Good
let message = TranslatedString(
    english: "Hello",
    french: "Bonjour",
    fallback: .english  // Explicit fallback
)

// Better - English is implicit fallback
let message = TranslatedString(
    english: "Hello",
    french: "Bonjour"
)
```

### Inconsistent Language Coverage
Ensure all TranslatedStrings support the same set of languages for consistency.

### Performance Considerations
Create TranslatedString instances as static constants when possible to avoid repeated initialization.