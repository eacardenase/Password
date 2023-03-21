//
//  ViewControllerTests.swift
//  PasswordTests
//
//  Created by Edwin Cardenas on 3/21/23.
//

import XCTest

@testable import Password

class ViewControllerTests_NewPassword_Validation: XCTestCase {
    var vc: ViewController!
    let validPassword = "01234567Aa!"
    let tooShort = "0123Aa!"
    let invalidPassword = "01234567Aa§"
    
    override func setUp() {
        super.setUp()
        
        vc = ViewController()
    }
    
    func testEmptyPassword() throws {
        vc.newPasswordText = ""
        vc.resetPasswordButtonTapped(UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Enter your new password")
    }
    
    func testInvalidPassword() throws {
        vc.newPasswordText = invalidPassword
        vc.resetPasswordButtonTapped(UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Enter valid spectial chars (.,@:?!()$\\/#) with no spaces")
    }
    
    func testCriteriaNotMet() throws {
        vc.newPasswordText = tooShort
        vc.resetPasswordButtonTapped(UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Your password must met the requirements bellow")
    }
    
    func testValidPassword() throws {
        vc.newPasswordText = validPassword
        vc.resetPasswordButtonTapped(UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "")
    }
}

class ViewControllerTests_Confirm_Password_Validation: XCTestCase {
    var vc: ViewController!
    let validPassword = "01234567Aa!"
    let tooShort = "0123Aa!"
    
    override func setUp() {
        super.setUp()
        
        vc = ViewController()
    }
    
    func testEmptyPassword() throws {
        vc.confirmPasswordText = ""
        vc.resetPasswordButtonTapped(UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorMessageLabel.text!, "Enter your password")
    }
    
    func testPasswordsDoNotMatch() {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = tooShort
        vc.resetPasswordButtonTapped(UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorMessageLabel.text!, "Passwords do not match")
    }
    
    func testPasswordsDoMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        vc.resetPasswordButtonTapped(UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorMessageLabel.text!, "")
    }
}
