//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 26/07/2023.
//

import Foundation
import Languages
import Dependencies

//
//public extension Languages.Language {
//    struct Client2 {
//        var value: @Sendable () -> Languages.Language
//        var setValue: @Sendable (Languages.Language) -> Void
//        var values: @Sendable () -> AsyncStream<Languages.Language>
//
//        init(
//            value: @Sendable @escaping () -> Languages.Language,
//            setValue: @Sendable @escaping (Languages.Language) -> Void,
//            values: @Sendable @escaping () -> AsyncStream<Languages.Language>
//        ) {
//            self.value = value
//            self.setValue = setValue
//            self.values = values
//        }
//    }
//}
//
//extension Language.Client2:DependencyKey {
//    public static var liveValue: Languages.Language.Client2 {
//        
//        actor Manager {
//
//            var languages: [Languages.Language] = [.preferredLanguageForUser()]
//
//            func append(_ element: Languages.Language) {
//                languages.append(element)
//            }
//
//            func value() -> Languages.Language {
//                languages.last!
//            }
//        }
//        
//        let manager = Manager()
//
//        
//        return .init(
//            value: {
//                print("value")
//                return manager.value()
//            },
//            setValue: {
//                print("setValue")
//                manager.append($0)
//            },
//            values: {
//                AsyncStream { continuation in
//                    print("test")
////                    let cancellable = subject
//////                        .dropFirst()
////                        .removeDuplicates()
////                        .sink { value in
////                            continuation.yield(value)
////                        }
//                    
//                    
//                    continuation.onTermination = { _ in
//                        print("continuation.onTermination")
//                        cancellable.cancel()
//                    }
//                }
//            }
//        )
//        
//        
//    }
//    
//    public static var testValue: Language.Client2 = liveValue
//}
//
//
//
//
