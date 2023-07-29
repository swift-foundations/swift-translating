import XCTest
@testable import Languages
@testable import Language_Client
import Dependencies


final class LanguageClientTests: XCTestCase {
    
    func testInitial() async throws {

        @Dependency(\.newLanguageClient) var client
        
        
        
        
        XCTAssert(client.value() == Languages.Language.dutch)
        
        client.setValue(.english)
        
        XCTAssert(client.value() == .english)
        
        
    }
}
