//
//  TransferValidationProtocol.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 17/01/22.
//

import Foundation

protocol TransferValidationProtocol {
    func validateRecipient(_ username: SelectUserModel?) throws -> SelectUserModel
    func validateAmount(_ amount: Int?) throws -> Int
}
