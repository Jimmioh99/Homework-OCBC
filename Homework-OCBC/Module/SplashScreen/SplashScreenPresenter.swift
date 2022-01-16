//
//  SplashScreenPresenter.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import UIKit

final class SplashScreenPresenter: SplashScreenPresenterDelegate {
    
    weak var view: SplashScreenViewControllerDelegate?
    lazy var router: SplashScreenRouterDelegate? = SplashScreenRouter(view: view)
    lazy var interactor: SplashScreenInteractorInputDelegate = SplashScreenInteractor(presenter: self)
    
    init(view: SplashScreenViewControllerDelegate?) {
        self.view = view
    }
    
    func pushToHome() {
        router?.pushToHome()
    }
    
    func pushToLogin() {
        router?.pushToLogin()
    }
}

extension SplashScreenPresenter: SplashScreenInteractorOutputDelegate {
    
    
}

