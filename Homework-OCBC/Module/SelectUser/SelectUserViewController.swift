//
//  SelectUserViewController.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import UIKit
import RxSwift
import Alamofire

class SelectUserViewController: UIViewController {
    
    var userData: [SelectUserModel] = []
    
    let root = SelectUserView()
    
    lazy var presenter: SelectUserPresenterDelegate = SelectUserPresenter(view: self)
    
    var disposeBag = DisposeBag()
    
    var callback: ((SelectUserModel)-> Void) = { _ in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        presenter.getPayees()
        
        setupTable()
        
        setRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setupTable() {
        root.selectTable.dataSource = self
        root.selectTable.delegate = self
    }
    
    func setRx() {
        root.backBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.presenter.popToHome()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
    
}

extension SelectUserViewController: SelectUserViewControllerDelegate {
    func successGetPayees(model: [SelectUserModel]) {
        self.userData = model
        root.selectTable.reloadData()
    }
    
    func failureGetPayees(error: AFError) {
        
    }
}

extension SelectUserViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TransactionTableCell
        let model = userData[indexPath.row]
        cell.nameLbl.text = model.name
        cell.accountNumberLbl.text = model.accountNo
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        callback(userData[indexPath.row])
        self.presenter.popToHome()
    }


}

    




    


