//
//  LoginInteractor.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import UIKit

class LoginInteractor: LoginInteractorInputDelegate {
    
    weak var presenter: LoginInteractorOutputDelegate?
    
    init(presenter: LoginInteractorOutputDelegate) {
//        super.init(presenter: presenter as! BasePresenter)
        self.presenter = presenter
    }
    
    func postLogin(username: String, password: String) {
        
        guard let url = URL(string: urlString + "login") else {
            return handler(nil)
        }
        
        let parameters: [String: Any] = [
                "username": "yoshi",
                "password": "test123"
            ]
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                return
            }
            request.httpBody = httpBody
            request.timeoutInterval = 20
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let response = response {
                    print(response)
                }
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let values = try decoder.decode(LoginModel.self, from: data)
                        handler(values)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        
    }
}

extension LoginInteractor: LoginInteractorOutputDelegate {
    func successPostLogin() {
        
    }
    
    func failurePostLogin() {
        
    }
    
    
}

