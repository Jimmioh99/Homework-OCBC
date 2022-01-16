//
//  SplashScreenProtocol.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import UIKit

protocol SplashScreenViewControllerDelegate: AnyObject {
}

protocol SplashScreenPresenterDelegate: AnyObject {
    func pushToHome()
    func pushToLogin()
}

protocol SplashScreenRouterDelegate: AnyObject {
    func pushToHome()
    func pushToLogin()
}

protocol SplashScreenInteractorInputDelegate: AnyObject {
    
}

protocol SplashScreenInteractorOutputDelegate: AnyObject {
}










