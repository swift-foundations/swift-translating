//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation
import Testing

@Test func `locale Language Identifiers`() {

    Locale.isoLanguageCodes.sorted(by: <).forEach { code in
        print(code)
    }

    //    Locale.isoLanguageCodes.sorted().compactMap { Locale.Language(identifier: $0) }.forEach { identifier in
    //        let x = """
    //        \(identifier.languageCode)
    //        \(identifier.minimalIdentifier)
    //        \(identifier.maximalIdentifier)
    //
    //        """
    //
    //        print(x)
    //    }

    Locale.availableIdentifiers.sorted().forEach { identifier in
        print(identifier)
    }
    print("Locale.availableIdentifiers: ", Locale.availableIdentifiers.count)
}
