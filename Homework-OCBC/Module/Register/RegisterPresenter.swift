//
//  RegisterPresenter.swift
//  Registerwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import Alamofire

final class RegisterPresenter: RegisterPresenterDelegate {
    
    weak var view: RegisterViewControllerDelegate?
    lazy var router: RegisterRouterDelegate? = RegisterRouter(view: view)
    lazy var interactor: RegisterInteractorInputDelegate = RegisterInteractor(presenter: self)
    
    init(view: RegisterViewControllerDelegate?) {
        self.view = view
    }
    
    func postRegister(username: String, password: String) {
        interactor.postRegister(username: username, password: password)
    }
    
    func pushToHome() {
        router?.pushToHome()
    }
    
    func popToHome() {
        router?.popToHome()
    }
}

extension RegisterPresenter: RegisterInteractorOutputDelegate {
    func successRegister(model: RegisterModel) {
        view?.successRegister(model: model)
    }
    
    func failureRegister(error: AFError) {
        view?.failureRegister(error: error)
    }
}







