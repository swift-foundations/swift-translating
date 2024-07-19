//
//  stringforlanguages.swift
//  Trust
//
//  Created by Coen ten Thije Boonkkamp on 11/06/2020.
//  Copyright © 2020 LegalKit. All rights reserved.
//

import Foundation

extension Language {
    public func callAsFunction<A>(
        dutch: A? = nil,
        arabic: A? = nil,
        chinese: A? = nil,
        danish: A? = nil,
        english: A,
        french: A? = nil,
        german: A? = nil,
        italian: A? = nil,
        japanese: A? = nil,
        korean: A? = nil,
        portuguese: A? = nil,
        russian: A? = nil,
        spanish: A? = nil,
        swedish: A? = nil,
        turkish: A? = nil
    ) -> A {
        switch self {
        case .english: return english
        case .dutch: return dutch ?? english
        case .chinese: return chinese ?? english
//        case .danish: return danish ?? english
        case .french: return french ?? english
        case .german: return german ?? english
        case .italian: return italian ?? english
        case .japanese: return japanese ?? english
        case .korean: return korean ?? english
        case .portuguese: return portuguese ?? english
        case .russian: return russian ?? english
        case .spanish: return spanish ?? english
//        case .swedish: return swedish ?? english
//        case .turkish: return turkish ?? english
        case .arabic: return arabic ?? english
        default: return english
        }
    }

    public func callAsFunction<A>(_ all: A) -> A {
        all
    }
}
