//
//  RegisterViewController.swift
//  Registerwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class RegisterViewController: UIViewController {
    
    let root = RegisterView()
    lazy var presenter: RegisterPresenterDelegate = RegisterPresenter(view: self)
    
    var disposeBag = DisposeBag()
    
    var loadingVC: UIAlertController?
    
    private let validation: RegisterValidation = RegisterValidation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        setRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        //        setStatusBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setRx() {
        root.backBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.presenter.popToHome()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        root.registerBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.loadingVC = self?.loader()
            self?.checkRegister()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
    
    func checkRegister() {
        do {
            let username = try validation.validateUsername(root.usernameTF.formTF.text)
            let password = try validation.validatePassword(root.passwordTF.formTF.text)
            let currentPassword = try validation.validatePassword(root.currentPasswordTF.formTF.text)
            _ = try validation.validateSamePassword(password, currentPassword)
            root.errorView.isHidden = true
            presenter.postRegister(username: username, password: password)
        } catch {
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

extension RegisterViewController: RegisterViewControllerDelegate {
    func successRegister(model: RegisterModel) {
        stopLoading()
        presenter.pushToHome()
    }
    
    func failureRegister(error: AFError) {
        stopLoading()
        setError(error: error.localizedDescription)
    }
    
    
}
