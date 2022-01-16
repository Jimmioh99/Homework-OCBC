//
//  RegisterModel.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import Foundation
import SwiftyJSON

public struct RegisterModel: Codable {
    
    public let status: String
    public let token: String
    
    init(json: JSON) {
        status = json["status"].stringValue
        token = json["token"].stringValue
    }
}

