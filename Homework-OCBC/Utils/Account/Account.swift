//
//  Account.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import Foundation
import SwiftyJSON

struct Account {

    enum Value {
        case token
        case username
        case accountNo
        
//        case access_token
//        case refresh_token
//        case expire_access_token
//        case expire_refresh_token
//        case profile_image
//        case name
//        case id
//        case address
//        case role_id
//        case joined_at
//        case phone_number
//        case role
//        case is_active
//        case email
//        case detail
    }
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
    static let standard = Account(json: JSON(parseJSON: ""))

    func getStrValue(_ key: Account.Value) -> String {
        return Account.get("\(key)", "")
    }

    func getIntValue(_ key: Account.Value) -> Int {
        return Account.get("\(key)", 0)
    }

    func getBoolValue(_ key: Account.Value) -> Bool {
        return Account.get("\(key)", false)
    }
    
    func getDateValue(_ key: Account.Value) -> Date? {
        return Account.get("\(key)", Date())
    }
    
    func getArrStrValue(_ key: Account.Value) -> [String] {
        return UserDefaults.standard.object(forKey: Account.key("\(key)")) as? [String] ?? []
    }
    
    func saveValue(_ key: Account.Value, _ val: Any) {
        Account.set("\(key)", val)
    }
    
    init(json: JSON) {
        Account.save(dictionary: json.dictionaryValue)
    }
    
    private static func save(dictionary: [String: JSON]) {
        for (key, value) in dictionary {
            if value != .null {
                if let dict = value.dictionary {
                    save(dictionary: dict)
                    continue
                }
                if Account.get(key, "") == "" || Account.get(key, -1) == -1 {
                    if let val = value.int {
                        Account.set(key, val)
                    }
                    if let val = value.string {
                        Account.set(key, val)
                    }
                } else {
//                    print("key: \(key) : \(value)")
                }
                
            }
        }
    }
    
    fileprivate static func get<T>(_ key: String, _ defaultValue: T) -> T {
        return UserDefaults.standard.value(forKey: Account.key(key)) as? T ?? defaultValue
    }
    
    static func set(_ key: String, _ myValue: Any) {
        UserDefaults.standard.set(myValue, forKey: Account.key(key))
    }
    
    fileprivate static func key(_ value: String) -> String {
        return "Homework-OCBC-App-Account-" + value
    }
    
    static func remove(_ keys: [String]) {
        for key in keys {
            UserDefaults.standard.set(nil, forKey: Account.key(key))
        }
    }

//    // ACCESS TOKEN
//    static func getUserAccessToken() -> String? {
//        return Account.standard.getStrValue(Value.access_token)
//    }
//
//    static func setUserAccessToken(_ token: String) {
//        Account.standard.saveValue(Value.access_token, token)
//    }
//
//    // REFRESH TOKEN
//    static func getUserRefreshToken() -> String? {
//        return Account.standard.getStrValue(Value.refresh_token)
//    }
//
//    static func setUserRefreshToken(_ token: String) {
//        Account.standard.saveValue(Value.refresh_token, token)
//    }
//
//    // ACCESS TOKEN EXPIRES IN
//    static func getAccessExpireIn() -> Date? {
//        return Account.standard.getDateValue(Value.expire_access_token)
//    }
//
//    static func setAccessExpireIn(_ second: Double) {
//        let dateNow = Date().timeIntervalSince1970 + second
//        let dateFuture = Date(timeIntervalSince1970: dateNow)
//        Account.standard.saveValue(Value.expire_access_token, dateFuture)
//    }
//
//    // REFRESH TOKEN EXPIRES IN
//    static func getRefreshExpireIn() -> Date? {
//        return Account.standard.getDateValue(Value.expire_refresh_token)
//    }
//
//    static func setRefreshExpireIn(_ expiredDate: Date?) {
//        Account.standard.saveValue(Value.expire_refresh_token, expiredDate ?? Date())
//    }
}
