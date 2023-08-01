import XCTest
@testable import Languages
@testable import LanguageClient
import Dependencies


final class LanguageClientTests: XCTestCase {
    
    func testInitial() async throws {

        @Dependency(\.language) var client
        
        
//        
//        
//        XCTAssert(client.value() == Languages.Language.dutch)
//        
//        client.setValue(.english)
//        
//        XCTAssert(client.value() == .english)
//        
        
    }
}
