//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 17-12-2023.
//

import Foundation
import Dependencies

extension DependencyValues {
    public var language: Language {
        get { self[Language.self] }
        set { self[Language.self] = newValue }
    }
}

extension Language: DependencyKey {
    public static let liveValue: Self = .english
    public static let testValue: Self = .english
}
