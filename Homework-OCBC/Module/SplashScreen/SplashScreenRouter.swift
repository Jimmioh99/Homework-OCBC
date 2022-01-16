//
//  SplashScreenRouter.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import UIKit

final class SplashScreenRouter: SplashScreenRouterDelegate {
    
    weak var source: UIViewController?
    
    init(view: SplashScreenViewControllerDelegate?) {
        source = view as? UIViewController
    }
    
    func pushToHome() {
        let homeVC = HomeViewController()
        if let navigationController = source?.navigationController {
            navigationController.pushViewController(homeVC, animated: true)
        }
    }
    
    func pushToLogin() {
        let registerVC = LoginViewController()
        if let navigationController = source?.navigationController {
            navigationController.pushViewController(registerVC, animated: true)
        }
    }
}

