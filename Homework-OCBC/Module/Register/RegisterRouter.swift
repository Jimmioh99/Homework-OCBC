//
//  RegisterRouter.swift
//  Registerwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit

final class RegisterRouter: RegisterRouterDelegate {
    
    
    weak var source: UIViewController?
    
    init(view: RegisterViewControllerDelegate?) {
        source = view as? UIViewController
    }
    
    func pushToHome() {
        let homeVC = HomeViewController(presenter: AppDI.shared.homeDependencies())
        if let navigationController = source?.navigationController {
            navigationController.pushViewController(homeVC, animated: true)
        }
    }
}

