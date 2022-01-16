//
//  LoginViewController.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController, ObservableObject {
    
    let root = LoginView()
//    var appDI: AppDIProtocol
     var presenter: LoginPresenter
    
    private let validation: LoginValidation = LoginValidation()
    
    var disposeBag = DisposeBag()
    
    public init(presenter: LoginPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
//    public init(appDI: AppDIProtocol) {
//        self.appDI = appDI
//        self.presenter = appDI.loginDependencies()
//        super.init(nibName: nil, bundle: nil)
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setRx()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disposeBag = DisposeBag()
        resetForm()
    }
    
    func resetForm() {
        root.usernameTF.formTF.text = ""
        root.passwordTF.formTF.text = ""
        resignFirstResponder()
    }
    
    func checkLogin() {
        do {
            let username = try validation.validateUsername(root.usernameTF.formTF.text)
            let password = try validation.validatePassword(root.passwordTF.formTF.text)
            presenter.postLogin(username: username, password: password)
        } catch {
//            present(error, animated: true)
            print("error")
        }
        
        
//        presenter.pushToHome()
    }
    
    func setRx() {
        root.loginBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.checkLogin()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        root.registerBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.presenter.pushToRegister()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
}

extension LoginViewController: LoginViewControllerDelegate {
    func successPostLogin() {
        presenter.pushToHome()
    }
    
    func failurePostLogin() {
        
    }
}
