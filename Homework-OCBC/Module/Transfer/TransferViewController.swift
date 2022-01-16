//
//  TransferViewController.swift
//  Transferwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class TransferViewController: UIViewController {
    
    let root = TransferView()
    lazy var presenter: TransferPresenterDelegate = TransferPresenter(view: self)
    
    var loadingVC: UIAlertController?
    
    var disposeBag = DisposeBag()
    
    var recipientModel: SelectUserModel? = nil
    
    private let validation: TransferValidation = TransferValidation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        setRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    func stopLoading() {
        if let loadingVC = self.loadingVC {
            self.stopLoader(loader: loadingVC)
        }
    }
    
    func setRx() {
        root.backBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.presenter.popToHome()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        root.transferBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.loadingVC = self?.loader()
            self?.checkTransfer()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        root.payeeBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.presenter.pushToSelectUser({ userModel in
                print(userModel)
                self?.root.payeeBtn.resultLbl.text = userModel.name
                self?.recipientModel = userModel
            })
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
    
    func checkTransfer() {
        do {
            let recipientModel = try validation.validateRecipient(self.recipientModel)
            let amount = try validation.validateAmount(Int(self.root.amountTF.formTF.text ?? ""))
            let description = self.root.descriptionTV.formTV.text
            root.errorView.isHidden = true
            self.presenter.postTransfer(accountNo: recipientModel.accountNo, amount: amount, description: description)
        } catch {
            print("error")
            stopLoading()
            setError(error: error.localizedDescription)
        }
    }
    
    func setError(error: String) {
        root.errorView.isHidden = false
        root.errorView.textLbl.text = error
    }
    
    
}

extension TransferViewController : TransferViewControllerDelegate {
    func successPostTransfer(model: TransferModel) {
        stopLoading()
        presenter.popToHome()
    }
    func failurePostTransfer(error: AFError) {
        stopLoading()
        setError(error: error.localizedDescription)
    }
}

