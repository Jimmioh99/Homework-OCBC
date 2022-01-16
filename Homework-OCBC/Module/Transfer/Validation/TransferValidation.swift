//
//  TransferValidation.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 17/01/22.
//

import Foundation

struct TransferValidation: TransferValidationProtocol {
    func validateRecipient(_ user: SelectUserModel?) throws -> SelectUserModel {
        guard let user = user else { throw TransferError.invalidUserValue}
        return user
    }
    
    func validateAmount(_ amount: Int?) throws -> Int {
        guard let amount = amount else { throw TransferError.invalidAmountValue}
        return amount
    }
    
    
}
