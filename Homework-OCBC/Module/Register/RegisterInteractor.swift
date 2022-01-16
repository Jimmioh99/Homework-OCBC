//
//  RegisterInteractor.swift
//  Registerwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit

class RegisterInteractor: RegisterInteractorInputDelegate {
    
    weak var presenter: RegisterInteractorOutputDelegate?
    
    init(presenter: RegisterInteractorOutputDelegate) {
//        super.init(presenter: presenter as! BasePresenter)
        self.presenter = presenter
    }
    
    func postRegister(username: String, password: String, currentPassword: String) {
        successRegister()
    }
}

extension RegisterInteractor: RegisterInteractorOutputDelegate {
    func successRegister() {
        presenter?.successRegister()
    }
    
    func failureRegister() {
        presenter?.failureRegister()
    }
}


