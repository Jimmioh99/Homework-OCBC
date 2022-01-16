//
//  TransferPresenter.swift
//  Transferwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit

final class TransferPresenter: TransferPresenterDelegate {
    
    weak var view: TransferViewControllerDelegate?
    lazy var router: TransferRouterDelegate? = TransferRouter(view: view)
    lazy var interactor: TransferInteractorInputDelegate = TransferInteractor(presenter: self)
    
    init(view: TransferViewControllerDelegate?) {
        self.view = view
    }
}

extension TransferPresenter: TransferInteractorOutputDelegate {

}







