//
//  TransferProtocol.swift
//  Transferwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import Alamofire

protocol TransferViewControllerDelegate: AnyObject {
    func successPostTransfer(model: TransferModel)
    func failurePostTransfer(error: AFError)
}

protocol TransferPresenterDelegate: AnyObject {
    func postTransfer(accountNo: String, amount: Int, description: String?)
    
    func pushToSelectUser(_ callback: @escaping ((SelectUserModel) -> Void))
    func popToHome()
}

protocol TransferRouterDelegate: AnyObject {
    func pushToSelectUser(_ callback: @escaping ((SelectUserModel) -> Void))
    func popToHome()
}

protocol TransferInteractorInputDelegate: AnyObject {
    func postTransfer(accountNo: String, amount: Int, description: String?)
}

protocol TransferInteractorOutputDelegate: AnyObject {
    func successPostTransfer(model: TransferModel)
    func failurePostTransfer(error: AFError)
    
}








