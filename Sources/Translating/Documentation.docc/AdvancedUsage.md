# Advanced Usage

Advanced patterns and techniques for complex internationalization scenarios.

## Generic Translation Containers

Work with any type, not just strings:

```swift
// Translated prices for different regions
let productPrices: Translated<Double> = [
    .english: 9.99,    // USD
    .dutch: 8.49,      // EUR
    .japanese: 1299.0  // JPY
]

// Translated configurations
let serverEndpoints: Translated<URL> = [
    .english: URL(string: "https://api-us.example.com")!,
    .dutch: URL(string: "https://api-eu.example.com")!,
    .chinese: URL(string: "https://api-asia.example.com")!
]

// Custom business logic based on language
@Dependency(\.language) var currentLanguage

func getCurrentPrice() -> Double {
    return productPrices[currentLanguage]
}

func getAPIEndpoint() -> URL {
    return serverEndpoints[currentLanguage]
}
```

## Custom Translation Logic

Create dynamic translations based on runtime conditions:

```swift
struct ConditionalTranslation {
    let condition: () -> Bool
    let trueTranslation: TranslatedString
    let falseTranslation: TranslatedString
    
    func resolve() -> TranslatedString {
        condition() ? trueTranslation : falseTranslation
    }
}

// Usage example
let timeBasedGreeting = ConditionalTranslation(
    condition: { Calendar.current.component(.hour, from: Date()) < 12 },
    trueTranslation: TranslatedString([
        .english: "Good morning",
        .dutch: "Goedemorgen",
        .french: "Bonjour"
    ]),
    falseTranslation: TranslatedString([
        .english: "Good afternoon", 
        .dutch: "Goedemiddag",
        .french: "Bon après-midi"
    ])
)

let currentGreeting = timeBasedGreeting.resolve()
```

## Organized Translation Hierarchies

Structure translations for maintainability in large applications:

```swift
enum AppTranslations {
    enum Navigation {
        static let home: TranslatedString = [
            .dutch: "Home",
            .english: "Home", 
            .french: "Accueil",
            .german: "Startseite",
            .spanish: "Inicio"
        ]
        
        static let settings: TranslatedString = [
            .dutch: "Instellingen",
            .english: "Settings",
            .french: "Paramètres",
            .german: "Einstellungen",
            .spanish: "Configuración"
        ]
        
        static let profile: TranslatedString = [
            .dutch: "Profiel",
            .english: "Profile",
            .french: "Profil",
            .german: "Profil",
            .spanish: "Perfil"
        ]
    }
    
    enum Errors {
        static let networkError: TranslatedString = [
            .dutch: "Netwerkfout",
            .english: "Network Error",
            .french: "Erreur Réseau",
            .german: "Netzwerkfehler",
            .spanish: "Error de Red"
        ]
        
        static let invalidInput: TranslatedString = [
            .dutch: "Ongeldige invoer",
            .english: "Invalid Input",
            .french: "Entrée Invalide",
            .german: "Ungültige Eingabe",
            .spanish: "Entrada Inválida"
        ]
    }
    
    enum Validation {
        static func passwordTooShort(minLength: Int) -> TranslatedString {
            return TranslatedString([
                .english: "Password must be at least \(minLength) characters",
                .dutch: "Wachtwoord moet minimaal \(minLength) tekens hebben",
                .french: "Le mot de passe doit contenir au moins \(minLength) caractères",
                .german: "Passwort muss mindestens \(minLength) Zeichen haben",
                .spanish: "La contraseña debe tener al menos \(minLength) caracteres"
            ])
        }
    }
}

// Usage
let errorMessage = AppTranslations.Errors.networkError.description
let validationError = AppTranslations.Validation.passwordTooShort(minLength: 8).description
```

## Complex Plural Handling

Advanced singular/plural scenarios with dynamic content:

```swift
import SinglePlural

struct ItemCounter {
    let count: Int
    
    var countText: SinglePlural<TranslatedString> {
        SinglePlural(
            single: TranslatedString([
                .english: "\(count) item",
                .dutch: "\(count) item",
                .french: "\(count) élément",
                .german: "\(count) Element",
                .spanish: "\(count) artículo"
            ]),
            plural: TranslatedString([
                .english: "\(count) items",
                .dutch: "\(count) items", 
                .french: "\(count) éléments",
                .german: "\(count) Elemente",
                .spanish: "\(count) artículos"
            ])
        )
    }
    
    func displayText() -> String {
        let variant: SinglePlural.Variant = count == 1 ? .single : .plural
        return countText(variant).description
    }
}

// Advanced plural with different rules per language
struct SmartPluralizer {
    static func filesSelected(_ count: Int) -> TranslatedString {
        return TranslatedString { language in
            switch language {
            case .english:
                return count == 1 ? "\(count) file selected" : "\(count) files selected"
            case .dutch:
                return count == 1 ? "\(count) bestand geselecteerd" : "\(count) bestanden geselecteerd"
            case .french:
                return count == 1 ? "\(count) fichier sélectionné" : "\(count) fichiers sélectionnés"
            case .russian:
                // Russian has complex plural rules
                if count % 10 == 1 && count % 100 != 11 {
                    return "\(count) файл выбран"
                } else if (2...4).contains(count % 10) && !(12...14).contains(count % 100) {
                    return "\(count) файла выбрано"
                } else {
                    return "\(count) файлов выбрано"
                }
            default:
                return "\(count) files selected"  // Fallback
            }
        }
    }
}
```

## Language-Specific Business Logic

Execute different code paths based on current language:

```swift
import Foundation
import Dependencies

struct LocalizedFormatterService {
    @Dependency(\.language) var currentLanguage
    
    func formatCurrency(_ amount: Decimal) -> String {
        let locale = currentLanguage.locale
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale
        
        return formatter.string(from: amount as NSDecimalNumber) ?? "\(amount)"
    }
    
    func formatPercentage(_ value: Double) -> String {
        let locale = currentLanguage.locale
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.locale = locale
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        
        return formatter.string(from: NSNumber(value: value)) ?? "\(value * 100)%"
    }
    
    func formatFileSize(_ bytes: Int64) -> String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useAll]
        formatter.countStyle = .file
        
        // Different formatting styles per language
        switch currentLanguage {
        case .english, .usEnglish:
            formatter.allowsNonnumericFormatting = false
        case .german:
            formatter.allowsNonnumericFormatting = true
        default:
            formatter.allowsNonnumericFormatting = false
        }
        
        return formatter.string(fromByteCount: bytes)
    }
}
```

## Advanced Testing Strategies

Comprehensive testing across all language scenarios:

```swift
import Testing
import Dependencies
@testable import YourApp

@Suite("Translation Tests")
struct TranslationTests {
    
    @Test("All languages have translations")
    func testAllLanguagesHaveTranslations() {
        let greeting: TranslatedString = [
            .english: "Hello",
            .dutch: "Hallo",
            .french: "Bonjour"
        ]
        
        // Test that all major languages resolve to something
        let majorLanguages: [Language] = [.english, .dutch, .french, .german, .spanish]
        
        for language in majorLanguages {
            withDependencies { $0.language = language } operation: {
                let result = greeting.description
                #expect(!result.isEmpty, "Language \(language) should have a translation")
            }
        }
    }
    
    @Test("Fallback chains work correctly")
    func testFallbackChains() {
        let text: TranslatedString = [
            .english: "Hello",
            .dutch: "Hallo"
        ]
        
        // Test fallback: afrikaans → dutch → english
        #expect(text[.afrikaans] == "Hallo", "Afrikaans should fallback to Dutch")
        
        // Test fallback: chinese → english
        #expect(text[.chinese] == "Hello", "Chinese should fallback to English")
        
        // Test fallback: limburgish → dutch → english
        #expect(text[.limburgish] == "Hallo", "Limburgish should fallback to Dutch")
    }
    
    @Test("Plural forms work correctly", arguments: [1, 2, 5, 21])
    func testPluralForms(count: Int) {
        let items = SinglePlural(
            single: TranslatedString([.english: "item", .dutch: "item"]),
            plural: TranslatedString([.english: "items", .dutch: "items"])
        )
        
        let variant: SinglePlural.Variant = count == 1 ? .single : .plural
        let expected = count == 1 ? "item" : "items"
        
        withDependencies { $0.language = .english } operation: {
            #expect(items(variant).description == expected)
        }
    }
    
    @Test("Performance benchmark", .disabled("Only run when needed"))
    func testPerformance() {
        // Dictionary literal vs closure performance
        let iterations = 1000
        
        // Fast approach
        let start1 = Date()
        for _ in 0..<iterations {
            let _: TranslatedString = [
                .english: "Hello",
                .dutch: "Hallo",
                .french: "Bonjour"
            ]
        }
        let dictionaryTime = Date().timeIntervalSince(start1)
        
        // Slow approach (limited languages for testing)
        withDependencies { $0.languages = [.english, .dutch, .french] } operation: {
            let start2 = Date()
            for _ in 0..<iterations {
                let _ = TranslatedString { language in
                    switch language {
                    case .english: return "Hello"
                    case .dutch: return "Hallo"
                    case .french: return "Bonjour"
                    default: return "Hello"
                    }
                }
            }
            let closureTime = Date().timeIntervalSince(start2)
            
            let ratio = closureTime / dictionaryTime
            print("Dictionary: \(dictionaryTime)s, Closure: \(closureTime)s, Ratio: \(ratio)x")
            #expect(ratio > 2.0, "Closure should be slower than dictionary literal")
        }
    }
}
```

## Dynamic Translation Loading

Load translations from external sources:

```swift
actor TranslationLoader {
    private var cache: [String: TranslatedString] = [:]
    
    func loadTranslation(key: String) async throws -> TranslatedString {
        if let cached = cache[key] {
            return cached
        }
        
        // Load from bundle
        if let bundleTranslation = loadFromBundle(key: key) {
            cache[key] = bundleTranslation
            return bundleTranslation
        }
        
        // Load from network as fallback
        let networkTranslation = try await loadFromNetwork(key: key)
        cache[key] = networkTranslation
        return networkTranslation
    }
    
    private func loadFromBundle(key: String) -> TranslatedString? {
        guard let path = Bundle.main.path(forResource: "Translations", ofType: "json"),
              let data = FileManager.default.contents(atPath: path),
              let json = try? JSONSerialization.jsonObject(with: data) as? [String: [String: String]],
              let translations = json[key] else {
            return nil
        }
        
        var translationDict: [Language: String] = [:]
        for (languageCode, translation) in translations {
            if let language = Language(rawValue: languageCode) {
                translationDict[language] = translation
            }
        }
        
        guard !translationDict.isEmpty else { return nil }
        
        let defaultValue = translationDict[.english] ?? translationDict.values.first!
        return TranslatedString(default: defaultValue, dictionary: translationDict)
    }
    
    private func loadFromNetwork(key: String) async throws -> TranslatedString {
        // Implement network loading
        let url = URL(string: "https://api.example.com/translations/\(key)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        struct NetworkTranslation: Codable {
            let translations: [String: String]
        }
        
        let networkResult = try JSONDecoder().decode(NetworkTranslation.self, from: data)
        
        var translationDict: [Language: String] = [:]
        for (languageCode, translation) in networkResult.translations {
            if let language = Language(rawValue: languageCode) {
                translationDict[language] = translation
            }
        }
        
        let defaultValue = translationDict[.english] ?? "Missing Translation"
        return TranslatedString(default: defaultValue, dictionary: translationDict)
    }
}

// Usage
let loader = TranslationLoader()

Task {
    let welcomeText = try await loader.loadTranslation(key: "welcome_message")
    print(welcomeText.description)
}
```

## Custom Language Dependencies

Create custom dependency contexts for different parts of your app:

```swift
struct UserPreferences {
    let preferredLanguages: [Language]
    let fallbackLanguage: Language
}

extension DependencyValues {
    var userPreferences: UserPreferences {
        get { self[UserPreferencesKey.self] }
        set { self[UserPreferencesKey.self] = newValue }
    }
}

private enum UserPreferencesKey: DependencyKey {
    static let liveValue = UserPreferences(
        preferredLanguages: [.english],
        fallbackLanguage: .english
    )
}

// Smart language resolver
struct SmartLanguageResolver {
    @Dependency(\.userPreferences) var preferences
    @Dependency(\.locale) var systemLocale
    
    func resolveOptimalLanguage(from available: Set<Language>) -> Language {
        // Try user preferences first
        for preferred in preferences.preferredLanguages {
            if available.contains(preferred) {
                return preferred
            }
        }
        
        // Try system locale
        let systemLanguage = Language(locale: systemLocale)
        if available.contains(systemLanguage) {
            return systemLanguage
        }
        
        // Use fallback
        return preferences.fallbackLanguage
    }
}
```