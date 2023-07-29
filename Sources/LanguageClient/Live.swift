////
////  File.swift
////  
////
////  Created by Coen ten Thije Boonkkamp on 26/10/2022.
////
//
//import Foundation
//import Dependencies
//import Languages
//
//extension Language:DependencyKey {
//    public static let liveValue:Self = .live
//}
//
//extension Language {
//    public static var live: Self = .dutch
//}
//
//extension LanguageClient:DependencyKey {
//    public static let liveValue:Self = .live
//}
//
//var currentlanguage:Language = .live
//
//extension LanguageClient {
//    public static var live: Self = .init(
//        set: { language in
//            Language.live = language
//            currentlanguage = language
//        }
//    )
//}
