//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation

@testable import Translating
import Dependencies
import DependenciesTestSupport
import Testing

@Suite(
    "Translating Tests",
    .dependency(\.locale, .english)
)
struct TranslatingTests {
    
    @Suite("Closure-based Initializer with Dependencies")
    struct ClosureBasedInitializerTests {
        
        @Test("Closure initializer uses languages dependency")
        func closureInitializerUsesLanguagesDependency() {
            let customLanguages: Set<Language> = [.dutch, .french, .german]
            
            withDependencies {
                $0.languages = customLanguages
            } operation: {
                let translated = Translated<String> { language in
                    switch language {
                    case .dutch: return "Hallo"
                    case .french: return "Bonjour"
                    case .german: return "Hallo"
                    default: return "Hello"
                    }
                }
                
                // Should only contain the languages in the dependency
                #expect(translated[.dutch] == "Hallo")
                #expect(translated[.french] == "Bonjour")
                #expect(translated[.german] == "Hallo")
                #expect(translated[.spanish] == "Hello")  // Falls back to default
            }
        }
        
        @Test(
            "Closure initializer with limited languages dependency",
        )
        func closureInitializerWithLimitedLanguagesDependency() {
            let limitedLanguages: Set<Language> = [.dutch, .english]
            
            withDependencies {
                $0.languages = limitedLanguages
            } operation: {
                let translated = Translated<String> { language in
                    "Content for \(language.rawValue)"
                }
                
                #expect(translated[.dutch] == "Content for nl")   // Has Dutch translation
                #expect(translated[.english] == "Content for en")  // Has English translation (also the default)
                #expect(translated[.french] == "Content for en")   // Falls back to default
                #expect(translated[.german] == "Content for en")   // Falls back to default
            }
        }
    }
    
    @Suite("Mass Initializer with Dependencies")
    struct MassInitializerDependenciesTests {
        
        @Test("Mass initializer respects languages dependency")
        func massInitializerRespectsLanguagesDependency() {
            let customLanguages: Set<Language> = [.dutch, .french]
            
            withDependencies {
                $0.languages = customLanguages
            } operation: {
                let translated = Translated(
                    "Default",
                    dutch: "Hallo",
                    french: "Bonjour",
                    german: "Hallo",  // This should be ignored
                    spanish: "Hola"   // This should be ignored
                )
                
                // Only Dutch and French should be in dictionary
                #expect(translated[.dutch] == "Hallo")
                #expect(translated[.french] == "Bonjour")
                #expect(translated[.german] == "Default")  // Falls back to default
                #expect(translated[.spanish] == "Default") // Falls back to default
            }
        }
        
        @Test("Mass initializer with no matching languages")
        func massInitializerWithNoMatchingLanguages() {
            let customLanguages: Set<Language> = [.italian, .portuguese]
            
            withDependencies {
                $0.languages = customLanguages
            } operation: {
                let translated = Translated(
                    "Default",
                    dutch: "Hallo",
                    french: "Bonjour",
                    german: "Hallo"
                )
                
                // No languages should match
                #expect(translated[.dutch] == "Default")     // Falls back to default
                #expect(translated[.french] == "Default")    // Falls back to default
                #expect(translated[.german] == "Default")    // Falls back to default
                #expect(translated.default == "Default")
            }
        }
    }
    
    @Suite("CustomStringConvertible with Dependencies")
    struct CustomStringConvertibleTests {
        
        @Test("Description uses current language dependency")
        func descriptionUsesCurrentLanguageDependency() {
            let translated = Translated(
                "Default",
                dutch: "Hallo",
                french: "Bonjour",
                german: "Hallo"
            )
            
            withDependencies {
                $0.language = .dutch
            } operation: {
                #expect(translated.description == "Hallo")
            }
            
            withDependencies {
                $0.language = .french
            } operation: {
                #expect(translated.description == "Bonjour")
            }
            
            withDependencies {
                $0.language = .spanish  // Falls back to default
            } operation: {
                #expect(translated.description == "Default")
            }
        }
    }
    
    @Suite("Comparable with Dependencies")
    struct ComparableWithDependenciesTests {
        
        @Test("Comparison uses current language dependency")
        func comparisonUsesCurrentLanguageDependency() {
            let translated1 = Translated(
                "Apple",
                dutch: "Appel",
                french: "Pomme"
            )
            let translated2 = Translated(
                "Banana",
                dutch: "Banaan",
                french: "Banane"
            )
            
            withDependencies {
                $0.language = .english
            } operation: {
                #expect(translated1 < translated2)  // "Apple" < "Banana"
            }
            
            withDependencies {
                $0.language = .dutch
            } operation: {
                #expect(translated1 < translated2)  // "Appel" < "Banaan"
            }
            
            withDependencies {
                $0.language = .french
            } operation: {
                #expect(translated2 < translated1)  // "Banane" < "Pomme"
            }
        }
    }
    
    @Suite("Slug Functionality")
    struct SlugFunctionalityTests {
        
        @Test("Slug with default language dependency")
        func slugWithDefaultLanguageDependency() {
            let translated = Translated<String> { language in
                switch language {
                case .english: return "Hello World"
                case .dutch: return "Hallo Wereld"
                case .french: return "Bonjour Monde"
                default: return "Hello World"
                }
            }

            withDependencies {
                $0.language = .english
            } operation: {
                #expect(translated.slug().description == "hello-world")
            }

            withDependencies {
                $0.language = .dutch
            } operation: {
                #expect(translated.slug().description == "hallo-wereld")
            }

            withDependencies {
                $0.language = .french
            } operation: {
                #expect(translated.slug().description == "bonjour-monde")
            }
        }
        
        @Test("Slug with specific language parameter")
        func slugWithSpecificLanguageParameter() {
            let translated = Translated<String> { language in
                switch language {
                case .english: return "Test String"
                case .spanish: return "Cadena de Prueba"
                default: return "Test String"
                }
            }

            withDependencies {
                $0.language = .spanish
            } operation: {
                #expect(translated.slug().description == "cadena-de-prueba")
            }

            withDependencies {
                $0.language = .english
            } operation: {
                #expect(translated.slug().description == "test-string")
            }
        }
        
        @Test("Slug with special characters")
        func slugWithSpecialCharacters() {
            let translated: Translated<String> = "Hello! World@123 #Test"
            
            withDependencies {
                $0.language = .english
            } operation: {
                #expect(translated.slug() == "hello-world-123-test")
            }
        }
        
        @Test("Slug with leading trailing spaces")
        func slugWithLeadingTrailingSpaces() {
            let translated: Translated<String> = "  Hello World  "
            
            withDependencies {
                $0.language = .english
            } operation: {
                #expect(translated.slug() == "hello-world")
            }
        }
        
        @Test("Slug with multiple spaces")
        func slugWithMultipleSpaces() {
            let translated: Translated<String> = "Hello    World    Test"
            
            withDependencies {
                $0.language = .english
            } operation: {
                #expect(translated.slug() == "hello-world-test")
            }
        }
        
        @Test("Slug with empty string")
        func slugWithEmptyString() {
            let translated = Translated<String>("")
            
            withDependencies {
                $0.language = .english
            } operation: {
                #expect(translated.slug() == "")
            }
        }
        
        @Test("Slug with only special characters")
        func slugWithOnlySpecialCharacters() {
            let translated = Translated<String>("!@#$%^&*()")
            
            withDependencies {
                $0.language = .english
            } operation: {
                #expect(translated.slug() == "")
            }
        }
    }
    
    
    @Suite("Edge Cases with Dependencies")
    struct EdgeCasesWithDependenciesTests {
        
        @Test("Empty languages dependency")
        func emptyLanguagesDependency() {
            let emptyLanguages: Set<Language> = []
            
            withDependencies {
                $0.languages = emptyLanguages
            } operation: {
                let translated = Translated<String> { language in
                    "Content for \(language.rawValue)"
                }
                
                #expect(translated[.french] == "Content for en")    // Falls back to default
                #expect(translated[.german] == "Content for en")    // Falls back to default
                #expect(translated.default == "Content for en")     // Uses English as default
            }
        }
        
        @Test("Single language dependency")
        func singleLanguageDependency() {
            let singleLanguage: Set<Language> = [.french]
            
            withDependencies {
                $0.languages = singleLanguage
            } operation: {
                let translated = Translated(
                    "Default",
                    dutch: "Hallo",
                    french: "Bonjour",
                    german: "Hallo"
                )
                
                #expect(translated[.french] == "Bonjour")
                #expect(translated[.dutch] == "Default")   // Falls back to default
                #expect(translated[.german] == "Default")  // Falls back to default
            }
        }
        
        @Test("Dependency changes don't affect existing instances")
        func dependencyChangesDontAffectExistingInstances() {
            var translated: Translated<String>!
            
            withDependencies {
                $0.languages = [.dutch, .french]
            } operation: {
                translated = Translated(
                    "Default",
                    dutch: "Hallo",
                    french: "Bonjour",
                    german: "Hallo"
                )
            }
            
            // Translated instance should maintain its original dictionary
            #expect(translated[.dutch] == "Hallo")
            #expect(translated[.french] == "Bonjour")
            #expect(translated[.german] == "Default")  // Not included in original dependency
            
            // Even if we change the dependency later
            withDependencies {
                $0.languages = [.german]
            } operation: {
                // Original instance unchanged
                #expect(translated[.dutch] == "Hallo")
                #expect(translated[.french] == "Bonjour")
                #expect(translated[.german] == "Default")  // Still not in original instance
            }
        }
    }
}
