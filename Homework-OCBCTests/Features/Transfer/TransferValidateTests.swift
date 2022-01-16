//
//  TransferValidateTests.swift
//  Homework-OCBCTests
//
//  Created by Jimmi Oh on 17/01/22.
//

import XCTest
@testable import Homework_OCBC

class TransferValidateTests: XCTestCase { // Test Suite
    var sut: TransferValidation!
    
    override func setUp() {
        super.setUp()
        sut = TransferValidation()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_userModelIsNil_validateUser_shouldThrowInvalidUserValue() throws {
        var error: TransferError?
        
        XCTAssertThrowsError(try sut.validateRecipient(nil)) { thrownError in
            error = thrownError as? TransferError
        }
        
        XCTAssertEqual(error, .invalidUserValue)
    }
    
    func test_amountIsNil_validateAmount_shouldThrowInvalidAmountValue() throws {
        var error: TransferError?
        
        XCTAssertThrowsError(try sut.validateAmount(nil)) { thrownError in
            error = thrownError as? TransferError
        }
        
        XCTAssertEqual(error, .invalidAmountValue)
    }
}

