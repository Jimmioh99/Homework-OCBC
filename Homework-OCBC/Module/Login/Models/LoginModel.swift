//
//  LoginModel.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import Foundation
import SwiftyJSON

struct LoginModel: Codable {
    
    let status: String
    let token: String
    let username: String
    let accountNo: String
    
    init(json: JSON) {
        status = json["status"].stringValue
        token = json["token"].stringValue
        username = json["username"].stringValue
        accountNo = json["accountNo"].stringValue
    }
}
