//
//  LoginValidation.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 11/01/22.
//

import Foundation

struct LoginValidation: AuthorizeValidationProtocol {
    func validateUsername(_ username: String?) throws -> String {
        guard let username = username else { throw AuthorizeError.invalidValue }
        guard username.count > 3 else { throw AuthorizeError.usernameTooShort }
        guard username.count < 10 else { throw AuthorizeError.usernameTooLong }
        return username
    }
    
    func validatePassword(_ password: String?) throws -> String {
        guard let password = password else { throw AuthorizeError.invalidValue }
        guard password.count > 3 else { throw AuthorizeError.passwordTooShort }
        guard password.count < 10 else { throw AuthorizeError.passwordTooLong }
        return password
    }
}


    



