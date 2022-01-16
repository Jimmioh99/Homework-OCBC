//
//  LoginViewController.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class LoginViewController: UIViewController {
    
    let root = LoginView()

    lazy var presenter: LoginPresenterDelegate = LoginPresenter(view: self)
    
    private let validation: LoginValidation = LoginValidation()
    
    var loadingVC: UIAlertController?
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        setRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setRx() {
        root.loginBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.loadingVC = self?.loader()
            self?.checkLogin()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        root.registerBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.presenter.pushToRegister()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
    
    func checkLogin() {
        do {
            let username = try validation.validateUsername(root.usernameTF.formTF.text)
            let password = try validation.validatePassword(root.passwordTF.formTF.text)
            root.errorView.isHidden = true
            presenter.postLogin(username: username, password: password)
        } catch {
            print(error.localizedDescription)
            print("error")
            stopLoading()
            setError(error: error.localizedDescription)
        }
    }
    
    func stopLoading() {
        if let loadingVC = self.loadingVC {
            self.stopLoader(loader: loadingVC)
        }
    }
    
    func setError(error: String) {
        root.errorView.isHidden = false
        root.errorView.textLbl.text = error
    }
}

extension LoginViewController: LoginViewControllerDelegate {
    func successPostLogin(model: LoginModel) {
        stopLoading()
        presenter.pushToHome()
    }
    
    func failurePostLogin(error: AFError) {
        stopLoading()
        setError(error: error.localizedDescription)
    }
}
