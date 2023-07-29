//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 26/10/2022.
//

import Languages
import Dependencies

public extension Language {
    var current:Self { self }
}

public extension Languages.Language {
    struct Client {
//        public let get:@Sendable () async -> Language
//        public let set:@Sendable (Language) async -> Void
//
//        public var current: Language  {
//            get async {
//                await self.get()
//            }
//        }
        
        public let get: () -> Language
        public let set: (Language) -> Void

        public var current: Language  {
            self.get()
        }
    }
}

extension Language.Client:DependencyKey {
    public static var liveValue: Languages.Language.Client {
        
//        var language:Languages.Language = .preferredLanguageForUser()
        
        actor Manager {

            var languages: [Languages.Language] = []

            func append(_ element: Languages.Language) {
                languages.append(element)
            }

            func value() -> Languages.Language {
                languages.last ?? .preferredLanguageForUser()
            }
        }
        
//        let manager = Manager()
        
        var language:Languages.Language = .preferredLanguageForUser()
        
        return .init(
            get: {
//                manager.value()
                language
            },
            set: { newLanguage in
//                manager.append(newLanguage)
                language = newLanguage
            }
        )
    }
    
    public static var testValue: Language.Client = liveValue
}

typealias LanguageClient = Language.Client


public extension DependencyValues {
    var languageClient: Language.Client {
        get { self[Language.Client.self] }
        set { self[Language.Client.self] = newValue }
    }
}

public extension DependencyValues {
    var language: Language.Client {
        get { self.languageClient }
        set { self.languageClient = newValue }
    }
}

