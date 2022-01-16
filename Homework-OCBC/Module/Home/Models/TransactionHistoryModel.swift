//
//  TransactionHistoryModel.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import Foundation
import SwiftyJSON

struct TransactionHistoryModel {
    
    var date: String
    var modelData: [TransactionModel] = []
    
    var getDate: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            guard let changeDate = dateFormatter.date(from: date) else { return date }
            dateFormatter.dateFormat = "dd MMM yyyy"
            let dateStr = dateFormatter.string(from: changeDate)
            
            return dateStr
        }
    }
    
    init(date: String) {
        self.date = date
    }
}
        
struct TransactionModel {
    let transactionId: String
    let amount: Int
    let description: String
    let transactionType: String
    let user: UserModel?
    
    init(json: JSON) {
        transactionId = json["transactionId"].stringValue
        amount = json["amount"].intValue
        description = json["description"].stringValue
        transactionType = json["transactionType"].stringValue
        if transactionType == "transfer" {
            user = UserModel(json: json["receipient"])
        } else if transactionType == "received" {
            user = UserModel(json: json["sender"])
        } else {
            user = nil
        }
    }
}
