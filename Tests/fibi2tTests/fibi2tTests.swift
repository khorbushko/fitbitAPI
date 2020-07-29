import XCTest
@testable import fibi2t

final class fibi2tTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(fibi2t().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
