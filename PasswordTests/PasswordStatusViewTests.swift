//
//  PasswordStatusViewTests.swift
//  PasswordTests
//
//  Created by Edwin Cardenas on 3/21/23.
//

import XCTest

@testable import Password

class PasswordStatusViewTests_ShowCheckmarkOrReset_WhenValidation_Is_Inline: XCTestCase {
    var statusView: PasswordStatusView!
    let validPassword = "01234567Aa!"
    let tooShort = "123Aa!"

    override func setUp() {
        super.setUp()
        
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = true // inline
    }
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage) // ✅
    }
    
    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isResetImage) // ⚪️
    }
}

class PasswordStatusViewTests_ShowCheckmarkOrRedX_When_Validation_Is_Loss_Of_Focus: XCTestCase {
    var statusView: PasswordStatusView!
    let validPassword = "01234567Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = false
    }
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage) // ✅
    }
    
    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isXmarkImage) // ❌
    }
}

class PasswordStatusViewTests_Validate_Three_Of_Four_Checks: XCTestCase {
    var statusView: PasswordStatusView!
    
    let twoOfFour = "01234567A"
    let threeOfFour = "01234567Aa"
    let fourOfFour = "01234567Aa!"
    
    override func setUp() {
        super.setUp()
        
        statusView = PasswordStatusView()
    }
    
    func testTwoOfFour() throws {
        XCTAssertFalse(statusView.validate(twoOfFour))
    }
    
    func testThreeOfFour() throws {
        XCTAssertTrue(statusView.validate(threeOfFour))
    }
    
    func testFourOfFour() throws {
        XCTAssertTrue(statusView.validate(fourOfFour))
    }
}
