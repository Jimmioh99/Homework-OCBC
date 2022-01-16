//
//  LoginValidateTests.swift
//  Homework-OCBCTests
//
//  Created by Jimmi Oh on 13/01/22.
//

import XCTest
@testable import Homework_OCBC

class LoginValidateTests: XCTestCase { // Test Suite
    var sut: LoginValidation!
    
    override func setUp() {
        super.setUp()
        sut = LoginValidation()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_usernameIsValid_shouldSuccess() throws { // Test Case
        XCTAssertNoThrow(try sut.validateUsername("Yoshi"))
    }
    
    func test_usernameIsNil_validateUsername_shouldThrowInvalidValue() throws {
        var error: AuthorizeError?
        
        XCTAssertThrowsError(try sut.validateUsername(nil)) { thrownError in
            error = thrownError as? AuthorizeError
        }
        
        XCTAssertEqual(error, .invalidValue)
    }
    
    func test_usernameTooShort_validateUsername_shouldThrowError() throws {
        let expectedError = AuthorizeError.usernameTooShort
        var error: AuthorizeError?
        let username = "low"
        
        XCTAssertThrowsError(try sut.validateUsername(username)) {
            thrownError in
            error = thrownError as? AuthorizeError
        }
        
        XCTAssertEqual(expectedError, error)
    }
    
    func test_usernameTooLong_validateUsername_shouldThrowError() throws {
        let expectedError = AuthorizeError.usernameTooLong
        var error: AuthorizeError?
        let username = ("abcdefghijklmnopqrstuvwxyz")
        
        XCTAssertThrowsError(try sut.validateUsername(username)) {
            thrownError in
            error = thrownError as? AuthorizeError
        }
        
        XCTAssertEqual(expectedError, error)
    }
    
    func test_passwordIsValid_validatePassword_shouldSuccess() throws {
        XCTAssertNoThrow(try sut.validatePassword("Yoshi"))
    }
    
    func test_passwordIsNil_validatePassword_shouldThrowError() throws {
        let expectedError = AuthorizeError.invalidValue
        var error: AuthorizeError?
        
        XCTAssertThrowsError(try sut.validatePassword(nil)) {
            thrownError in
            error = thrownError as? AuthorizeError
        }
        
        XCTAssertEqual(expectedError, error)
    }
    
    func test_passwordTooShort_validatePassword_ShouldThrowError() throws {
        let expectedError = AuthorizeError.passwordTooShort
        var error: AuthorizeError?
        
        XCTAssertThrowsError(try sut.validatePassword("low")) {
            thrownError in
            error = thrownError as? AuthorizeError
        }
        
        XCTAssertEqual(expectedError, error)
    }
    
    func test_passwordTooLong_validatePassword_ShouldThrowError() throws {
        let expectedError = AuthorizeError.passwordTooLong
        var error: AuthorizeError?
        
        XCTAssertThrowsError(try sut.validatePassword("abcdefghijklmnopqrstuvwxyz")) {
            thrownError in
            error = thrownError as? AuthorizeError
        }
        
        XCTAssertEqual(expectedError, error)
    }
}

