//
//  LoginInteractor.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import UIKit
import SwiftyJSON
import Alamofire

class LoginInteractor: LoginInteractorInputDelegate {
    
    weak var presenter: LoginInteractorOutputDelegate?
    
    init(presenter: LoginInteractorOutputDelegate) {
        self.presenter = presenter
    }
    
    func postLogin(username: String, password: String) {
        
        guard let url = URL(string: urlString + "login") else { return }
        
        let headers: HTTPHeaders = [
            .contentType("application/x-www-form-urlencoded"),
       ]

        let parameters: Parameters = [
            "username": username,
            "password": password
        ]
        
        AF.request(url, method: HTTPMethod.post, parameters: parameters, headers: headers).validate().responseData(completionHandler: { [weak self] response in
            if let error = response.error {
                self?.failurePostLogin(error: error)
                return
            }
            do {
                let data = try response.result.get()
                let json = try JSON(data: data)
                _ = Account.init(json: json)
                let model = LoginModel(json: json)
                self?.successPostLogin(model: model)
            } catch {
                self?.failurePostLogin(error: AFError.explicitlyCancelled)
                return
            }
        })
    }
}

extension LoginInteractor: LoginInteractorOutputDelegate {
    func successPostLogin(model: LoginModel) {
        presenter?.successPostLogin(model: model)
    }
    
    func failurePostLogin(error: AFError) {
        presenter?.failurePostLogin(error: error)
    }
    
    
}

