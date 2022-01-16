//
//  TransferError.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 17/01/22.
//

import Foundation

enum TransferError: LocalizedError {
    case invalidUserValue
    case invalidAmountValue
    
    var errorDescription: String? {
        switch self {
        case .invalidUserValue:
            return "You must select recipient"
        case .invalidAmountValue:
            return "Something is wrong with the amount"
        }
    }
}
