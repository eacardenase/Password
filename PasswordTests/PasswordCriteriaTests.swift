//
//  PasswordCriteriaTests.swift
//  PasswordTests
//
//  Created by Edwin Cardenas on 3/21/23.
//

import XCTest

@testable import Password

class PasswordLengthCriteria: XCTestCase {
    
    // Boundary conditions 8 - 32
    
    func testShort() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("0123456"))
    }
    
    func testLong() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("012345678901234567890123456789012"))
    }
    
    func testValidShort() {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("01234567"))
    }
    
    func testValidLong() {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("01234567890123456789012345678901"))
    }
}

class PasswordOtherCriteriaTests: XCTestCase {
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("abc"))
    }
    
    func testSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("a bc"))
    }
    
    func testLengthAndNoSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.lengthAndNoSpaceMet("01234567"))
    }
    
    func testLengthAndNoSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("0123456 7"))
    }
    
    func testUppercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("A"))
    }
    
    func testUppercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.uppercaseMet("a"))
    }
    
    func testLowercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("a"))
    }
    
    func testLowercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lowercaseMet("A"))
    }
    
    func testDigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("1"))
    }
    
    func testDigitNotMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("a"))
    }
    
    func testSpecialCharacterMet() throws {
        XCTAssertTrue(PasswordCriteria.specialCharacterMet("!"))
    }
    
    func testSpecialCharacterNotMet() throws {
        XCTAssertFalse(PasswordCriteria.specialCharacterMet("a"))
    }
}
