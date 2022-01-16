//
//  RegisterPresenter.swift
//  Registerwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit

final class RegisterPresenter: RegisterPresenterDelegate {
    
    weak var view: RegisterViewControllerDelegate?
    lazy var router: RegisterRouterDelegate? = RegisterRouter(view: view)
    lazy var interactor: RegisterInteractorInputDelegate = RegisterInteractor(presenter: self)
    
    init(view: RegisterViewControllerDelegate?) {
        self.view = view
    }
    
    func postRegister(username: String, password: String, currentPassword: String) {
        interactor.postRegister(username: username, password: password, currentPassword: currentPassword)
    }
    
    func pushToHome() {
        router?.pushToHome()
    }
}

extension RegisterPresenter: RegisterInteractorOutputDelegate {
    func successRegister() {
        view?.successRegister()
    }
    
    func failureRegister() {
        view?.failureRegister()
    }
}







