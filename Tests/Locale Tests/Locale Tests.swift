import Foundation
import Testing

@Test func `locale Language Identifiers`() {

    Locale.isoLanguageCodes.sorted(by: <).forEach { code in
        print(code)
    }

    Locale.availableIdentifiers.sorted().forEach { identifier in
        print(identifier)
    }
    print("Locale.availableIdentifiers: ", Locale.availableIdentifiers.count)
}
