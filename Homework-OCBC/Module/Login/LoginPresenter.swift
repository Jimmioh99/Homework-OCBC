//
//  LoginPresenter.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import Alamofire

final class LoginPresenter: LoginPresenterDelegate {
    
    weak var view: LoginViewControllerDelegate?
    lazy var router: LoginRouterDelegate? = LoginRouter(view: view)
    lazy var interactor: LoginInteractorInputDelegate = LoginInteractor(presenter: self)
    
    init(view: LoginViewControllerDelegate?) {
        self.view = view
    }
    
    func pushToHome() {
        router?.pushToHome()
    }
    
    func pushToRegister() {
        router?.pushToRegister()
    }
    
    func postLogin(username: String, password: String) {
        interactor.postLogin(username: username, password: password)
    }
}

extension LoginPresenter: LoginInteractorOutputDelegate {
    func successPostLogin(model: LoginModel) {
        view?.successPostLogin(model: model)
    }
    
    func failurePostLogin(error: AFError) {
        view?.failurePostLogin(error: error)
    }
    
    
}







