//
//  HomeInteractor.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import SwiftyJSON
import Alamofire

class HomeInteractor: HomeInteractorInputDelegate {
    
    weak var presenter: HomeInteractorOutputDelegate?
    
    init(presenter: HomeInteractorOutputDelegate) {
        self.presenter = presenter
    }
    
    func getBalance() {
        
        guard let url = URL(string: urlString + "balance") else { return }
        
        let headers: HTTPHeaders = [
            .authorization(Account.standard.getStrValue(Account.Value.token)),
            .accept("application/json"),
            .contentType("application/json")
        ]
        
        AF.request(url, method: HTTPMethod.get, headers: headers).validate().responseData { [weak self] response in
            if let error = response.error {
                self?.failureGetBalance(error: error)
                return
            }
            do {
                let data = try response.result.get()
                let json = try JSON(data: data)
                _ = Account.init(json: json)
                let model = BalanceModel(json: json)
                self?.successGetBalance(model: model)
            } catch {
                self?.failureGetBalance(error: AFError.explicitlyCancelled)
                return
            }
        }
    }
    
    func getTransactionHistory() {
        
        guard let url = URL(string: urlString + "transactions") else { return }
        
        let headers: HTTPHeaders = [
            .authorization(Account.standard.getStrValue(Account.Value.token)),
            .accept("application/json"),
            .contentType("application/json")
       ]
        
        AF.request(url, method: HTTPMethod.get, headers: headers).validate().responseData { [weak self] response in
            if let error = response.error {
                self?.failureGetTransactionHistory(error: error)
                return
            }
            do {
                let data = try response.result.get()
                let json = try JSON(data: data)
                var transactionArr: [TransactionHistoryModel] = []
                
                _ = json["data"].arrayValue.map { json in
                    let dateStr = json["transactionDate"].stringValue
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                    guard let date = dateFormatter.date(from: dateStr) else { return }
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let checkDate = dateFormatter.string(from: date)
                    
                    if transactionArr.count == 0 {
                        transactionArr.append(TransactionHistoryModel(date: checkDate))
                        transactionArr[0].modelData.append(TransactionModel(json: json))
                    } else {
                        let arr = transactionArr.enumerated().filter { (index, model) in
                            if model.date == checkDate {
                                transactionArr[index].modelData.append(TransactionModel(json: json))
                                return true
                            }
                            return false
                        }
                        if Array(arr).count == 0 {
                            transactionArr.append(TransactionHistoryModel(date: checkDate))
                            transactionArr[transactionArr.count-1].modelData.append(TransactionModel(json: json))
                        }
                    }
                    
                    
                }
                self?.successGetTransactionHistory(model: transactionArr)
            } catch {
                self?.failureGetTransactionHistory(error: AFError.explicitlyCancelled)
                return
            }
        }
    }
}

extension HomeInteractor: HomeInteractorOutputDelegate {
    func successGetBalance(model: BalanceModel) {
        presenter?.successGetBalance(model: model)
    }
    
    func failureGetBalance(error: AFError) {
        presenter?.failureGetBalance(error: error)
    }
    
    func successGetTransactionHistory(model: [TransactionHistoryModel]) {
        presenter?.successGetTransactionHistory(model: model)
    }
    
    func failureGetTransactionHistory(error: AFError) {
        presenter?.failureGetTransactionHistory(error: error)
    }
    
    
}


