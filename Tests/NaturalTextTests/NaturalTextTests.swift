import SwiftUI
import XCTest
@testable import NaturalText

final class NaturalTextTests: XCTestCase {
    func testDirectionDetection() {
        XCTAssertEqual("Hello".naturalLayoutDirection, .leftToRight)
        XCTAssertEqual("שלום".naturalLayoutDirection, .rightToLeft)
        XCTAssertEqual("مرحبا".naturalLayoutDirection, .rightToLeft)
        XCTAssertEqual("سلام".naturalLayoutDirection, .rightToLeft) // Persian
        XCTAssertEqual("1שלום".naturalLayoutDirection, .rightToLeft)
        XCTAssertEqual("...Hello".naturalLayoutDirection, .leftToRight)
        XCTAssertEqual("🙂مرحبا".naturalLayoutDirection, .rightToLeft)
        XCTAssertEqual("".naturalLayoutDirection, .leftToRight)
        XCTAssertEqual("12345".naturalLayoutDirection, .leftToRight)
        XCTAssertEqual("שלום Hello".naturalLayoutDirection, .rightToLeft)
        XCTAssertEqual("Hello שלום".naturalLayoutDirection, .leftToRight)
    }

    func testEdgeCases() {
        XCTAssertEqual("ש".naturalLayoutDirection, .rightToLeft)
        XCTAssertEqual("A".naturalLayoutDirection, .leftToRight)
        XCTAssertEqual("   ".naturalLayoutDirection, .leftToRight)
        XCTAssertEqual("!!!".naturalLayoutDirection, .leftToRight)
    }
}
