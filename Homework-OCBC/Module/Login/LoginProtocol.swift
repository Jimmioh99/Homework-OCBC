//
//  LoginProtocol.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import Alamofire

protocol LoginViewControllerDelegate: AnyObject {
    func successPostLogin(model: LoginModel)
    func failurePostLogin(error: AFError)
}

protocol LoginPresenterDelegate: AnyObject {
    func pushToHome()
    func pushToRegister()
    
    func postLogin(username: String, password: String)
}

protocol LoginRouterDelegate: AnyObject {
    func pushToHome()
    func pushToRegister()
}

protocol LoginInteractorInputDelegate: AnyObject {
    func postLogin(username: String, password: String)
}

protocol LoginInteractorOutputDelegate: AnyObject {
    func successPostLogin(model: LoginModel)
    func failurePostLogin(error: AFError)
}

protocol LoginProtocol {
    
}








