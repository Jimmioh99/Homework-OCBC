//
//  SplashScreenInteractor.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import UIKit
import SwiftyJSON

class SplashScreenInteractor: SplashScreenInteractorInputDelegate {
    
    weak var presenter: SplashScreenInteractorOutputDelegate?
    
    init(presenter: SplashScreenInteractorOutputDelegate) {
        self.presenter = presenter
    }
}

extension SplashScreenInteractor: SplashScreenInteractorOutputDelegate {
    
    
}


