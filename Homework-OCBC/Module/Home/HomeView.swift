//
//  HomeView.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import SnapKit

class HomeView: UIView {
    
    let mainView = UIView()
    
    let logoutBtn = UIButton()
    
    let userInfoView = UIView()
    let userInfoStack = UIStackView()
    let youHaveTextLbl = UILabel()
    let balanceLbl = UILabel()
    let accountNumberTextLbl = UILabel()
    let accountNumberLbl = UILabel()
    let accountHolderTextLbl = UILabel()
    let accountHolderLbl = UILabel()
    
    let transactionTextLbl = UILabel()
    let transactionTable = UITableView()
    
    let transferBtn = CustomButton(title: "Make Transfer")
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(mainView)
        mainView.setupSubviews([logoutBtn, userInfoView, transactionTextLbl, transactionTable, transferBtn])
        userInfoView.addSubview(userInfoStack)
        userInfoStack.setupArrangedSubviews(
            youHaveTextLbl,
            balanceLbl,
            accountNumberTextLbl,
            accountNumberLbl,
            accountHolderTextLbl,
            accountHolderLbl
        )
        
        setupView()
        setupConstraints()
        setupText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupText() {
        userInfoView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        userInfoView.addShadow(radius: 30, corners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner])
        
        
        userInfoStack.alignment = .leading
        
        logoutBtn.setTitle("Logout", for: .normal)
        
        youHaveTextLbl.text = "You have"
        
        balanceLbl.text = "SGD 21,421.33"
        
        accountNumberTextLbl.text = "Account No"
        
        accountNumberLbl.text = "3213-321-9923"
        
        accountHolderTextLbl.text = "Account Holder"
        
        accountHolderLbl.text = "Donald Trump"
        
        transactionTextLbl.text = "Your transaction history"
    }
    
    func setupView() {
        logoutBtn.setTitleColor(.black, for: .normal)
        
        userInfoStack.axis = .vertical
        userInfoStack.spacing = 10
    }
    
    func setupConstraints() {
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        logoutBtn.snp.makeConstraints { make in
            make.top.equalTo(mainView).offset(30)
            make.trailing.equalTo(mainView).offset(-30)
        }
        
        userInfoView.snp.makeConstraints { make in
            make.top.equalTo(logoutBtn.snp.bottom).offset(30)
            make.leading.equalTo(mainView)
            make.trailing.equalTo(logoutBtn.snp.leading).offset(-10)
        }
        
        userInfoStack.snp.makeConstraints { make in
            make.top.equalTo(userInfoView).offset(30)
            make.leading.equalTo(userInfoView).offset(30)
            make.trailing.bottom.equalTo(userInfoView).offset(-30)
        }
        
        transactionTextLbl.snp.makeConstraints { make in
            make.top.equalTo(userInfoView.snp.bottom).offset(40)
            make.leading.equalTo(mainView).offset(30)
        }
        
        transactionTable.snp.makeConstraints { make in
            make.top.equalTo(transactionTextLbl.snp.bottom).offset(30)
            make.leading.trailing.equalTo(mainView)
            make.bottom.equalTo(transferBtn.snp.top).offset(-30)
        }
        
        transferBtn.snp.makeConstraints { make in
            make.leading.equalTo(mainView).offset(30)
            make.trailing.bottom.equalTo(mainView).offset(-30)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}

