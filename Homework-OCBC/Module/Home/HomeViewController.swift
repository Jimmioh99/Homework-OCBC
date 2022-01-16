//
//  HomeViewController.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class HomeViewController: UIViewController {
    
    var transactionData: [TransactionHistoryModel] = []
    
    let root = HomeView()
    lazy var presenter: HomePresenterDelegate = HomePresenter(view: self)
    
    var disposeBag = DisposeBag()
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        setupTable()
        
        setRx()
        
        root.mainScroll.refreshControl = refreshControl
        root.mainScroll.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        getDataFromServer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setupTable() {
        root.transactionTable.dataSource = self
        root.transactionTable.delegate = self
    }
    
    func getDataFromServer() {
        presenter.getBalance()
        presenter.getTransactionHistory()
    }
                                                  
    @objc func refresh() {
        getDataFromServer()
    }
    
    func endRefresh() {
        root.mainScroll.refreshControl?.endRefreshing()
    }
    
    func setRx() {
        root.transferBtn.rx.tap.subscribe(onNext: { [weak self] in
            self?.presenter.pushToTransfer()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        root.logoutBtn.rx.tap.subscribe(onNext: { [weak self] in
            Account.standard.resetDefaults()
            self?.presenter.popToRoot()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    
    func successGetBalance(model: BalanceModel) {
        root.balanceLbl.text = "SGD \(model.balance)"
    }
    
    func failureGetBalance(error: AFError) {
        
    }
    
    func successGetTransactionHistory(model: [TransactionHistoryModel]) {
        self.transactionData = model
        root.transactionTable.reloadData()
        endRefresh()
        
    }
    
    func failureGetTransactionHistory(error: AFError) {
        print(error)
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return transactionData.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TransactionHeaderView()
        headerView.dateLbl.text = transactionData[section].getDate
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = TransactionFooterView()
        return footerView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionData[section].modelData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TransactionTableCell
        let model = transactionData[indexPath.section].modelData[indexPath.row]
        cell.nameLbl.text = model.user?.accountHolder
        cell.accountNumberLbl.text = model.user?.accountNo
        cell.amountLbl.textColor = model.transactionType == "received" ? .green : .gray
        cell.amountLbl.text = "\(model.transactionType != "received" ? "- " : "")\(model.amount)"
        return cell
    }


}

    
