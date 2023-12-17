import XCTest
@testable import Languages
import Dependencies




final class LanguagesTests: XCTestCase {
    func testExample() {
        @Dependency(\.language) var language
        
        XCTAssert(language == .english)
        
        
        XCTAssert(language == .dutch)
        
        
        
    }

}
