//
//  RegisterViewController.swift
//  Registerwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {
    
    let root = RegisterView()
    lazy var presenter: RegisterPresenterDelegate = RegisterPresenter(view: self)
    
    var disposeBag = DisposeBag()
    
    private let validation: RegisterValidation = RegisterValidation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        //        setStatusBar()
        
        setRx()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setRx() {
        root.backBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        root.registerBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.checkRegister()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
    
    func checkRegister() {
        do {
            let username = try validation.validateUsername(root.usernameTF.formTF.text)
            let password = try validation.validatePassword(root.passwordTF.formTF.text)
            let currentPassword = try validation.validatePassword(root.currentPasswordTF.formTF.text)
            _ = try validation.validateSamePassword(password, currentPassword)
            presenter.postRegister(username: username, password: password, currentPassword: currentPassword)
        } catch {
//            present(error, animated: true)
            print("error")
        }
        
        
//        presenter.pushToHome()
    }
}

extension RegisterViewController: RegisterViewControllerDelegate {
    func successRegister() {
        presenter.pushToHome()
    }
    
    func failureRegister() {
        
    }
    
    
}
