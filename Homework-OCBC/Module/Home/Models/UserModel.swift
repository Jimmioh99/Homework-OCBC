//
//  UserModel.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import Foundation
import SwiftyJSON

struct UserModel {
    let accountNo: String
    let accountHolder: String
    
    init(json: JSON) {
        accountNo = json["accountNo"].stringValue
        accountHolder = json["accountHolder"].stringValue
    }
}
