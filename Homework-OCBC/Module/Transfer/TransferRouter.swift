//
//  TransferRouter.swift
//  Transferwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit

final class TransferRouter: TransferRouterDelegate {
    
    
    weak var source: UIViewController?
    
    init(view: TransferViewControllerDelegate?) {
        source = view as? UIViewController
    }
    
    func pushToSelectUser(_ callback: @escaping ((SelectUserModel) -> Void)) {
        let selectUserVC = SelectUserViewController()
        selectUserVC.callback = callback
        if let navigationController = source?.navigationController {
            navigationController.pushViewController(selectUserVC, animated: true)
        }
    }
    
    func popToHome() {
        if let navigationController = source?.navigationController {
            navigationController.popViewController(animated: true)
        }
    }
}

