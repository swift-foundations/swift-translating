//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 18/03/2023.
//

import Foundation
import Dependencies
import Languages







//
//public extension Languages.Language {
//    static var appLanguage:Self = .preferredLanguageForUser()
//}
//
//public extension DependencyValues {
//    var languageClient: LanguageClient {
//        get { self[LanguageKey.self] }
//        set { self[LanguageKey.self] = newValue }
//    }
//    
//    private enum LanguageKey: DependencyKey {
//        static let liveValue = LanguageClient.liveValue
//    }
//}

//extension TranslatedString:CustomStringConvertible {
//    public var description:String {
//        @Dependency(\.languageClient.current) var language
//        return self.translated(to: language)
//    }
//}
//
//extension Language:DependencyKey {
//    public static let liveValue:Self = .live
//}
//
//extension Language {
//    public static var live: Self = .preferredLanguageForUser()
//}
//
//extension LanguageClient:DependencyKey {
//    public static let liveValue:Self = .live
//}
//
//var currentlanguage:Language = .live
//
//public extension LanguageClient {
//    static var live: Self = .init(
//        get: {
//            Language.live
//        },
//        set: { language in
//            Language.live = language
//            currentlanguage = language
//        }
//    )
//    
//    static var testValue: LanguageClient = .init(
//        get: {
//            Language.live
//        },
//        set: { language in
//            Language.live = language
//            currentlanguage = language
//        }
//    )
//}
//
//
//
//public struct LanguageClient {
//    public var get: ()-> Languages.Language
//    public let set:(Languages.Language)->Void
//    
//    public var current:Language {
//        self.get()
//    }
//    
////    public subscript<T>(dynamicMember keyPath: KeyPath<Language, T>) -> T { language[keyPath: keyPath] }
//}










public struct EnvironmentState<State> {
  // A synchronous endpoint to immediately grab current state
  var value: () -> State

  // An asynchronous endpoint to update state, only should be called in effects.
  var setValue: (State) async -> Void

  // A publisher/async sequence of values to observe changes
  var values: () -> AsyncStream<State>
}

//extension Languages.Language {
//    static var asyncStream:AsyncStream<Self> {
//        .init { continuation in
//            continuation.
//        }
//    }
//}

//extension LanguageClientTCAProposed {
//    public static var live: Self = .init(
//        value: {
//            .live
//        },
//        setValue: { language in
//            Language.live = language
//        },
//        values: {
//            Language.asyncStream
//        }
//    )
//}
