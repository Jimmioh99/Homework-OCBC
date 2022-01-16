//
//  LoginProtocol.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func successPostLogin()
    func failurePostLogin()
}

protocol LoginPresenterInputDelegate: AnyObject {
    func pushToHome()
    func pushToRegister()
    
    func postLogin(username: String, password: String)
}

protocol LoginPresenterOutputDelegate: AnyObject {
    
}

protocol LoginRouterDelegate: AnyObject {
    func pushToHome()
    func pushToRegister()
}

protocol LoginInteractorInputDelegate: AnyObject {
    func postLogin(username: String, password: String)
}

protocol LoginInteractorOutputDelegate: AnyObject {
    func successPostLogin()
    func failurePostLogin()
}

protocol LoginProtocol {
    
}








