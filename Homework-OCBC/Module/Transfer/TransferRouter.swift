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
}

