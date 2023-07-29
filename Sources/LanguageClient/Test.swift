////
////  File.swift
////  
////
////  Created by Coen ten Thije Boonkkamp on 26/10/2022.
////
//
//import Foundation
//import Dependencies
//import XCTestDynamicOverlay
//import Languages
//
//
//
//extension DependencyValues {
//    public var language: Languages.Language {
//        get { self[Languages.Language.self] }
//        set { self[Languages.Language.self] = newValue }
//    }
//}
//
//extension Languages.Language: TestDependencyKey {
//    public static let previewValue = Self.noop
//#if DEBUG
//    public static let testValue:Self = .unimplemented
//#endif
//}
//
//
//
//extension Languages.Language {
//    public static let noop:Self = .dutch
//    
//#if DEBUG
//    public static let unimplemented:Self = .dutch
//#endif
//}
//
//
//
//////////
//
//extension DependencyValues {
//    public var languageClient: LanguageClient {
//        get { self[LanguageClient.self] }
//        set { self[LanguageClient.self] = newValue }
//    }
//}
//
//extension LanguageClient: TestDependencyKey {
//    public static let previewValue = Self.noop
//#if DEBUG
//    public static let testValue:Self = .unimplemented
//#endif
//}
//
//
//
//extension LanguageClient {
//    public static let noop:Self = .init(
//        set: { _ in ()}
//    )
//    
//#if DEBUG
//    public static let unimplemented:Self = .init(
//        set: { _ in ()}
//    )
//#endif
//}
