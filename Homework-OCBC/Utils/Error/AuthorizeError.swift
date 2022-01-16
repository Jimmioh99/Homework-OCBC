//
//  AuthorizeError.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 13/01/22.
//

import Foundation

enum AuthorizeError: LocalizedError {
    case invalidValue
    case usernameTooShort
    case usernameTooLong
    case passwordTooShort
    case passwordTooLong
    case passwordNotSame
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "You have entered an invalid value"
        case .usernameTooShort:
            return "Your username is too short"
        case .usernameTooLong:
            return "Your username is too long"
        case .passwordTooShort:
            return "Your password is too short"
        case .passwordTooLong:
            return "Your password is too long"
        case .passwordNotSame:
            return "Password and current password not same"
        }
    }
}

