//
//  TransferInteractor.swift
//  Transferwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import SwiftyJSON
import Alamofire

class TransferInteractor: TransferInteractorInputDelegate {
    
    weak var presenter: TransferInteractorOutputDelegate?
    
    init(presenter: TransferInteractorOutputDelegate) {
//        super.init(presenter: presenter as! BasePresenter)
        self.presenter = presenter
    }
    
    func postTransfer(accountNo: String, amount: Int, description: String?) {
        
        guard let url = URL(string: urlString + "transfer") else { return }
        
        let parameters: [String: Any] = [
            "receipientAccountNo": accountNo,
            "amount": amount,
            "description": description ?? ""
        ]
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Application/json", forHTTPHeaderField: "Accept")
            request.setValue(Account.standard.getStrValue(Account.Value.token), forHTTPHeaderField: "Authorization")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                return
            }
            request.httpBody = httpBody
            request.timeoutInterval = 20
            let session = URLSession.shared
            session.dataTask(with: request) { [weak self] (data, response, error) in
                if let response = response {
                    print(response)
                }
                if let data = data {
                    do {
                        let json = try JSON(data: data)
                        let model = TransferModel(json: json)
                        self?.successPostTransfer(model: model)
                    } catch {
                        self?.failurePostTransfer(error: AFError.sessionTaskFailed(error: error))
                    }
                }
            }.resume()
        
    }
}

extension TransferInteractor: TransferInteractorOutputDelegate {
    func successPostTransfer(model: TransferModel) {
        presenter?.successPostTransfer(model: model)
    }
    func failurePostTransfer(error: AFError) {
        presenter?.failurePostTransfer(error: error)
    }
}


