//
//  HomeInteractor.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit

class HomeInteractor: HomeInteractorInputDelegate {
    
    weak var presenter: HomeInteractorOutputDelegate?
    
    init(presenter: HomeInteractorOutputDelegate) {
//        super.init(presenter: presenter as! BasePresenter)
        self.presenter = presenter
    }
}

extension HomeInteractor: HomeInteractorOutputDelegate {
    
}


