//
//  HomeProtocol.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import Alamofire

protocol HomeViewControllerDelegate: AnyObject {
    func successGetBalance(model: BalanceModel)
    func failureGetBalance(error: AFError)
    func successGetTransactionHistory(model: [TransactionHistoryModel])
    func failureGetTransactionHistory(error: AFError)
}

protocol HomePresenterDelegate: AnyObject {
    func pushToTransfer()
    func popToRoot()
    
    func getBalance()
    func getTransactionHistory()
}

protocol HomeRouterDelegate: AnyObject {
    func pushToTransfer()
    func popToRoot()
}

protocol HomeInteractorInputDelegate: AnyObject {
    func getBalance()
    func getTransactionHistory()
}

protocol HomeInteractorOutputDelegate: AnyObject {
    func successGetBalance(model: BalanceModel)
    func failureGetBalance(error: AFError)
    func successGetTransactionHistory(model: [TransactionHistoryModel])
    func failureGetTransactionHistory(error: AFError)
    
}








