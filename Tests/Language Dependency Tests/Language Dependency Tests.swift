//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Dependencies
import Foundation
import Language
import Testing
import Translated
import TranslatedString

@testable import Language_Dependency

@Test func slugWithDefaultLanguage() {
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
        #expect(translated.slug() == "hello-world")
    }

    withDependencies {
        $0.language = .dutch
    } operation: {
        #expect(translated.slug() == "hallo-wereld")
    }

    withDependencies {
        $0.language = .french
    } operation: {
        #expect(translated.slug() == "bonjour-monde")
    }
}

@Test func slugWithSpecificLanguage() {
    let translated = Translated<String> { language in
        switch language {
        case .english: return "Test String"
        case .spanish: return "Cadena de Prueba"
        default: return "Test String"
        }
    }

    withDependencies {
        $0.language = .english
    } operation: {
        #expect(translated.slug(language: .spanish) == "cadena-de-prueba")
        #expect(translated.slug(language: .english) == "test-string")
    }
}

@Test func slugWithSpecialCharacters() {
    let translated = Translated<String> { _ in
        "Hello! World@123 #Test"
    }

    withDependencies {
        $0.language = .english
    } operation: {
        #expect(translated.slug() == "hello-world-123-test")
    }
}

@Test func slugWithLeadingTrailingSpaces() {
    let translated = Translated<String> { _ in
        "  Hello World  "
    }

    withDependencies {
        $0.language = .english
    } operation: {
        #expect(translated.slug() == "hello-world")
    }
}

@Test func slugWithMultipleSpaces() {
    let translated = Translated<String> { _ in
        "Hello    World    Test"
    }

    withDependencies {
        $0.language = .english
    } operation: {
        #expect(translated.slug() == "hello-world-test")
    }
}

@Test func slugWithEmptyString() {
    let translated = Translated<String> { _ in "" }

    withDependencies {
        $0.language = .english
    } operation: {
        #expect(translated.slug() == "")
    }
}

@Test func slugWithOnlySpecialCharacters() {
    let translated = Translated<String> { _ in "!@#$%^&*()" }

    withDependencies {
        $0.language = .english
    } operation: {
        #expect(translated.slug() == "")
    }
}
