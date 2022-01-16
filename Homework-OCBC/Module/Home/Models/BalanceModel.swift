//
//  BalanceModel.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import Foundation
import SwiftyJSON

struct BalanceModel: Decodable {
    let status: String
    let accountNo: String
    let balance: Int
    
    init(json: JSON) {
        status = json["status"].stringValue
        accountNo = json["accountNo"].stringValue
        balance = json["balance"].intValue
    }
}
