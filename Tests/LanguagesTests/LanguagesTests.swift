import Dependencies
@testable import Languages
import XCTest

final class LanguagesTests: XCTestCase {
    func testExample() {
        @Dependency(\.language) var language

        XCTAssert(language == .english)

        XCTAssert(language == .dutch)

    }

}
