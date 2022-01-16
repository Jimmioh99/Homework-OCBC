//
//  RegisterProtocol.swift
//  Registerwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import Alamofire

protocol RegisterViewControllerDelegate: AnyObject {
    func successRegister(model: RegisterModel)
    func failureRegister(error: AFError)
}

protocol RegisterPresenterDelegate: AnyObject {
    func pushToHome()
    
    func postRegister(username: String, password: String)
    
    func popToHome()
}

protocol RegisterRouterDelegate: AnyObject {
    func pushToHome()
    func popToHome()
}

protocol RegisterInteractorInputDelegate: AnyObject {
    func postRegister(username: String, password: String)
}

protocol RegisterInteractorOutputDelegate: AnyObject {
    func successRegister(model: RegisterModel)
    func failureRegister(error: AFError)
}

protocol RegisterProtocol {
 
}








