import XCTest
@testable import Languages
import Dependencies




final class LanguagesTests: XCTestCase {
    func testExample() {
        @Dependency(\.languages) var languages
        
        XCTAssert(languages == .english)
        
        
        XCTAssert(languages == .dutch)
        
        
        
    }

}
