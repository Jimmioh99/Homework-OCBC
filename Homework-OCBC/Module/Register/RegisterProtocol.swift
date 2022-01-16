//
//  RegisterProtocol.swift
//  Registerwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit

protocol RegisterViewControllerDelegate: AnyObject {
    func successRegister()
    func failureRegister()
}

protocol RegisterPresenterDelegate: AnyObject {
    func pushToHome()
    
    func postRegister(username: String, password: String, currentPassword: String)
}

protocol RegisterRouterDelegate: AnyObject {
    func pushToHome()
}

protocol RegisterInteractorInputDelegate: AnyObject {
    func postRegister(username: String, password: String, currentPassword: String)
}

protocol RegisterInteractorOutputDelegate: AnyObject {
    func successRegister()
    func failureRegister()
}

protocol RegisterProtocol {
 
}








