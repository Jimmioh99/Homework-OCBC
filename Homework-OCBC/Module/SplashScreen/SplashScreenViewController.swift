//
//  SplashScreenViewController.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import UIKit

class SplashScreenViewController: UIViewController, SplashScreenViewControllerDelegate {
    
    let root = SplashScreenView()
    
    lazy var presenter: SplashScreenPresenterDelegate = SplashScreenPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        checkIsLogin()
    }
    
    func checkIsLogin() {
        UIView.animate(withDuration: 1.5, animations: {

        }) { [weak self] (true) in
            if Account.standard.getStrValue(Account.Value.token) == "" {
                self?.presenter.pushToLogin()
            } else {
                self?.presenter.pushToHome()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
}



    

