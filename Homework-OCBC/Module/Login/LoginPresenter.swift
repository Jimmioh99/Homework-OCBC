//
//  LoginPresenter.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit

final class LoginPresenter: LoginPresenterDelegate {
    
    weak var view: LoginViewControllerDelegate?
    lazy var router: LoginRouterDelegate? = LoginRouter(view: view)
    lazy var interactor: LoginInteractorInputDelegate = LoginInteractor(presenter: self)
    
    init(view: LoginViewControllerDelegate?) {
        self.view = view
    }
}

extension LoginPresenter: LoginInteractorOutputDelegate {

}

extension LoginPresenter: LoginInteractorOutputDelegate {
    func successPostLogin() {
        view?.successPostLogin()
    }
    
    func failurePostLogin() {
        view?.failurePostLogin()
    }
    
    
}







