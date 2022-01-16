//
//  HomeView.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import SnapKit

class HomeView: UIView {
    
    let contentView = UIView()
    let mainScroll = UIScrollView()
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
    let transactionTable = UITableView(frame: CGRect(), style: UITableView.Style.grouped)
    
    let transferBtn = CustomButton(title: "Make Transfer")
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
//        addSubview(contentView)
        addSubview(mainScroll)
        mainScroll.addSubview(mainView)
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
//        logoutBtn.setContentHuggingPriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        
        youHaveTextLbl.text = "You have"
        
        balanceLbl.text = "SGD 0"
        mainView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: NSLayoutConstraint.Axis.horizontal)
        
        accountNumberTextLbl.text = "Account No"
        
        accountNumberLbl.text = Account.standard.getStrValue(Account.Value.accountNo)
        
        accountHolderTextLbl.text = "Account Holder"
        
        accountHolderLbl.text = Account.standard.getStrValue(Account.Value.username)
        
        transactionTextLbl.text = "Your transaction history"
    }
    
    func setupView() {
        logoutBtn.setTitleColor(.black, for: .normal)
        logoutBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        userInfoStack.axis = .vertical
        userInfoStack.spacing = 10
        
        youHaveTextLbl.font = UIFont.boldSystemFont(ofSize: 18)
        
        balanceLbl.font = UIFont.boldSystemFont(ofSize: 32)
        
        accountNumberTextLbl.font = UIFont.systemFont(ofSize: 15)
        accountNumberTextLbl.textColor = .gray
        
        accountNumberLbl.font = UIFont.boldSystemFont(ofSize: 18)
        
        accountHolderTextLbl.font = UIFont.systemFont(ofSize: 15)
        accountHolderTextLbl.textColor = .gray
        
        accountHolderLbl.font = UIFont.boldSystemFont(ofSize: 18)
        
        transactionTextLbl.font = UIFont.boldSystemFont(ofSize: 18)
        
        transactionTable.register(TransactionTableCell.self, forCellReuseIdentifier: "cell")
        transactionTable.bounces = false
        transactionTable.showsVerticalScrollIndicator = false
        transactionTable.backgroundColor = UIColor.white
        transactionTable.separatorStyle = .none
    }
    
    func setupConstraints() {
        
        let screenHeight = UIApplication.shared.windows[0].safeAreaLayoutGuide.layoutFrame.size.height
        
        mainScroll.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        mainView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(mainScroll)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(screenHeight)
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
            make.top.equalTo(transactionTextLbl.snp.bottom)
            make.leading.equalTo(mainView).offset(30)
            make.trailing.equalTo(mainView).offset(-30)
            make.bottom.equalTo(transferBtn.snp.top)
        }
        
        transferBtn.snp.makeConstraints { make in
            make.leading.equalTo(mainView).offset(30)
            make.trailing.bottom.equalTo(mainView).offset(-30)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}

