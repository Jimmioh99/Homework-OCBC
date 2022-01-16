//
//  RegisterInteractor.swift
//  Registerwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegisterInteractor: RegisterInteractorInputDelegate {
    
    weak var presenter: RegisterInteractorOutputDelegate?
    
    init(presenter: RegisterInteractorOutputDelegate) {
//        super.init(presenter: presenter as! BasePresenter)
        self.presenter = presenter
    }
    
    func postRegister(username: String, password: String) {
        
        guard let url = URL(string: urlString + "register") else { return }
        
        let headers: HTTPHeaders = [
            .contentType("application/x-www-form-urlencoded"),
//            .accept("application/json")
       ]
        
        let parameters: Parameters = [
            "username": username,
            "password": password
        ]
        
        AF.request(url, method: HTTPMethod.post, parameters: parameters, headers: headers).validate().responseData(completionHandler: { [weak self] response in
            if let error = response.error {
                self?.failureRegister(error: error)
                return
            }
            do {
                let data = try response.result.get()
                let json = try JSON(data: data)
                _ = Account.init(json: json)
                let model = RegisterModel(json: json)
                self?.successRegister(model: model)
            } catch {
                self?.failureRegister(error: AFError.explicitlyCancelled)
                return
            }
        })
    }
}

extension RegisterInteractor: RegisterInteractorOutputDelegate {
    func successRegister(model: RegisterModel) {
        presenter?.successRegister(model: model)
    }
    
    func failureRegister(error: AFError) {
        presenter?.failureRegister(error: error)
    }
}


