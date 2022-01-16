//
//  SelectUserInteractor.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import UIKit
import SwiftyJSON
import Alamofire

class SelectUserInteractor: SelectUserInteractorInputDelegate {
    
    weak var presenter: SelectUserInteractorOutputDelegate?
    
    init(presenter: SelectUserInteractorOutputDelegate) {
        self.presenter = presenter
    }
    
    func getPayees() {
        
        guard let url = URL(string: urlString + "payees") else { return }
        
        let headers: HTTPHeaders = [
            .authorization(Account.standard.getStrValue(Account.Value.token)),
            .accept("application/json"),
            .contentType("application/json")
       ]
        
        AF.request(url, method: HTTPMethod.get, headers: headers).validate().responseData { [weak self] response in
            if let error = response.error {
                self?.failureGetPayees(error: error)
                return
            }
            do {
                let data = try response.result.get()
                let json = try JSON(data: data)
                let modelArr = json["data"].arrayValue.map { json in
                    SelectUserModel(json: json)
                }
                self?.successGetPayees(model: modelArr)
            } catch {
                self?.failureGetPayees(error: AFError.explicitlyCancelled)
                return
            }
        }
    }
}

extension SelectUserInteractor: SelectUserInteractorOutputDelegate {
    func successGetPayees(model: [SelectUserModel]) {
        presenter?.successGetPayees(model: model)
    }
    
    func failureGetPayees(error: AFError) {
        presenter?.failureGetPayees(error: error)
    }
    
}

