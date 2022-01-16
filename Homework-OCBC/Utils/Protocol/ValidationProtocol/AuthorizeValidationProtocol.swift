//
//  AuthorizeValidationProtocol.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 11/01/22.
//

import Foundation

protocol AuthorizeValidationProtocol {
    func validateUsername(_ username: String?) throws -> String
    func validatePassword(_ password: String?) throws -> String
}

protocol AuthorizeRegisterValidationProtocol {
    func validateSamePassword(_ password: String?, _ currentPassword: String?) throws -> String
}
