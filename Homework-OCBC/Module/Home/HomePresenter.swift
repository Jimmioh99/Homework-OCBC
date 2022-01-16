//
//  HomePresenter.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import Alamofire

final class HomePresenter: HomePresenterDelegate {
    weak var view: HomeViewControllerDelegate?
    lazy var router: HomeRouterDelegate? = HomeRouter(view: view)
    lazy var interactor: HomeInteractorInputDelegate = HomeInteractor(presenter: self)
    
    init(view: HomeViewControllerDelegate?) {
        self.view = view
    }
    
    func pushToTransfer() {
        router?.pushToTransfer()
    }
    
    func popToRoot() {
        router?.popToRoot()
    }
    
    func getBalance() {
        interactor.getBalance()
    }
    
    func getTransactionHistory() {
        interactor.getTransactionHistory()
    }
    
    
}

extension HomePresenter: HomeInteractorOutputDelegate {
    func successGetBalance(model: BalanceModel) {
        view?.successGetBalance(model: model)
    }
    
    func failureGetBalance(error: AFError) {
        view?.failureGetBalance(error: error)
    }
    
    func successGetTransactionHistory(model: [TransactionHistoryModel]) {
        view?.successGetTransactionHistory(model: model)
    }
    
    func failureGetTransactionHistory(error: AFError) {
        view?.failureGetTransactionHistory(error: error)
    }
    

}







