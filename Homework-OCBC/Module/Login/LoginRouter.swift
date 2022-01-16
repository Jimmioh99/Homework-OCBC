//
//  LoginRouter.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit

final class LoginRouter: LoginRouterDelegate {
    
    
    weak var source: UIViewController?
    
    init(view: LoginViewControllerDelegate?) {
        source = view as? UIViewController
    }
    
    func pushToHome() {
        let homeVC = HomeViewController(presenter: AppDI.shared.homeDependencies())
        if let navigationController = source?.navigationController {
            navigationController.pushViewController(homeVC, animated: true)
        }
    }
    
    func pushToRegister() {
        let registerVC = RegisterViewController()
        if let navigationController = source?.navigationController {
            navigationController.pushViewController(registerVC, animated: true)
        }
    }
}
