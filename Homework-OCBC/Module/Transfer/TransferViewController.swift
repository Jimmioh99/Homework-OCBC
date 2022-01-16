//
//  TransferViewController.swift
//  Transferwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import RxSwift
import RxCocoa

class TransferViewController: UIViewController, TransferViewControllerDelegate {
    
    let root = TransferView()
    lazy var presenter: TransferPresenterDelegate = TransferPresenter(view: self)
    
    var disposeBag = DisposeBag()
    
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
    
    func setRx() {
        
    }
}

