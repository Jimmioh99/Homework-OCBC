//
//  TransferModel.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 17/01/22.
//

import Foundation
import SwiftyJSON

struct TransferModel {
    let amount: String
    let transactionId: String
    let description: String
    let status: String
    let recipientAccount: String
    
    init(json: JSON) {
        amount = json["amount"].stringValue
        transactionId = json["transactionId"].stringValue
        description = json["description"].stringValue
        status = json["status"].stringValue
        recipientAccount = json["recipientAccount"].stringValue
    }
}
