//
//  SelectUserProtocol.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import UIKit
import Alamofire

protocol SelectUserViewControllerDelegate: AnyObject {
    func successGetPayees(model: [SelectUserModel])
    func failureGetPayees(error: AFError)
}

protocol SelectUserPresenterDelegate: AnyObject {
    func getPayees()
    
    
    func popToHome()
}

protocol SelectUserRouterDelegate: AnyObject {
    func popToHome() 
}

protocol SelectUserInteractorInputDelegate: AnyObject {
    func getPayees()
}

protocol SelectUserInteractorOutputDelegate: AnyObject {
    func successGetPayees(model: [SelectUserModel])
    func failureGetPayees(error: AFError)
}











