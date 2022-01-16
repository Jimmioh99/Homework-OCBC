//
//  SelectUserPresenter.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import UIKit
import Alamofire

final class SelectUserPresenter: SelectUserPresenterDelegate {
    
    weak var view: SelectUserViewControllerDelegate?
    lazy var router: SelectUserRouterDelegate? = SelectUserRouter(view: view)
    lazy var interactor: SelectUserInteractorInputDelegate = SelectUserInteractor(presenter: self)
    
    init(view: SelectUserViewControllerDelegate?) {
        self.view = view
    }
    
    func getPayees() {
        interactor.getPayees()
    }
    
    func popToHome() {
        router?.popToHome()
    }
}

extension SelectUserPresenter: SelectUserInteractorOutputDelegate {
    func successGetPayees(model: [SelectUserModel]) {
        view?.successGetPayees(model: model)
    }
    
    func failureGetPayees(error: AFError) {
        view?.failureGetPayees(error: error)
    }
    
    
    
}


