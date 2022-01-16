//
//  TransferPresenter.swift
//  Transferwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import Alamofire

final class TransferPresenter: TransferPresenterDelegate {
    
    weak var view: TransferViewControllerDelegate?
    lazy var router: TransferRouterDelegate? = TransferRouter(view: view)
    lazy var interactor: TransferInteractorInputDelegate = TransferInteractor(presenter: self)
    
    init(view: TransferViewControllerDelegate?) {
        self.view = view
    }
    
    func postTransfer(accountNo: String, amount: Int, description: String?) {
        interactor.postTransfer(accountNo: accountNo, amount: amount, description: description)
    }
    
    func pushToSelectUser(_ callback: @escaping ((SelectUserModel) -> Void)) {
        router?.pushToSelectUser(callback)
    }
    
    func popToHome() {
        router?.popToHome()
    }
}

extension TransferPresenter: TransferInteractorOutputDelegate {

    func successPostTransfer(model: TransferModel) {
        view?.successPostTransfer(model: model)
    }
    func failurePostTransfer(error: AFError) {
        view?.failurePostTransfer(error: error)
    }
}







