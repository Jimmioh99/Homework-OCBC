//
//  SelectUserModel.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import Foundation
import SwiftyJSON

struct SelectUserModel {
    let id: String
    let name: String
    let accountNo: String
    
    init(json: JSON) {
        id = json["id"].stringValue
        name = json["name"].stringValue
        accountNo = json["accountNo"].stringValue
    }
}
