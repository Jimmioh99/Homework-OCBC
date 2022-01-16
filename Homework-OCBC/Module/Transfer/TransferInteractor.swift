//
//  TransferInteractor.swift
//  Transferwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit

class TransferInteractor: TransferInteractorInputDelegate {
    
    weak var presenter: TransferInteractorOutputDelegate?
    
    init(presenter: TransferInteractorOutputDelegate) {
//        super.init(presenter: presenter as! BasePresenter)
        self.presenter = presenter
    }
}

extension TransferInteractor: TransferInteractorOutputDelegate {
    
}


