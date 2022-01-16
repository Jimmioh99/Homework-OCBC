//
//  SelectUserView.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import SnapKit

class SelectUserView: UIView {
    
    lazy var mainView = UIView().parent(self)
    
    lazy var backBtn = BackButton().parent(mainView)
    
    lazy var selectTable = UITableView().parent(mainView)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupView()
        setupConstraints()
        setupText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupText() {
        
    }
    
    func setupView() {
        selectTable.register(TransactionTableCell.self, forCellReuseIdentifier: "cell")
        selectTable.separatorStyle = .none
    }
    
    func setupConstraints() {
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(mainView).offset(30)
            make.leading.equalTo(mainView).offset(30)
        }
        
        selectTable.snp.makeConstraints { make in
            make.top.equalTo(backBtn.snp.bottom).offset(30)
            make.leading.trailing.bottom.equalTo(mainView)
            
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}



