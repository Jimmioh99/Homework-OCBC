//
//  HomeRouter.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit

final class HomeRouter: HomeRouterDelegate {
    
    weak var source: UIViewController?
    
    init(view: HomeViewControllerDelegate?) {
        source = view as? UIViewController
    }
    
    func pushToTransfer() {
        let transferVC = TransferViewController()
        if let navigationController = source?.navigationController {
            navigationController.pushViewController(transferVC, animated: true)
        }
    }
}

