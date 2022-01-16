//
//  RegisterValidation.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 11/01/22.
//

import Foundation

struct RegisterValidation: AuthorizeValidationProtocol, AuthorizeRegisterValidationProtocol {
    func validateUsername(_ username: String?) throws -> String {
        guard let username = username, username != "" else { throw AuthorizeError.invalidValue }
        guard username.count > 3 else { throw AuthorizeError.usernameTooShort }
        guard username.count < 20 else { throw AuthorizeError.usernameTooLong }
        return username
    }
    
    func validatePassword(_ password: String?) throws -> String {
        guard let password = password, password != "" else { throw AuthorizeError.invalidValue }
        guard password.count > 3 else { throw AuthorizeError.passwordTooShort }
        guard password.count < 20 else { throw AuthorizeError.passwordTooLong }
        return password
    }
    
    func validateSamePassword(_ password: String?, _ currentPassword: String?) throws -> String {
        guard let password = try? validatePassword(password) else { throw AuthorizeError.invalidValue }
        guard let currentPassword = try? validatePassword(currentPassword) else { throw AuthorizeError.invalidValue }
        guard password == currentPassword else { throw AuthorizeError.passwordNotSame }
        return password
    }
    
    
}
