//
//  TransferView.swift
//  Transferwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import SnapKit

final class TransferView: UIView {
    let mainView = UIView()
    
    lazy var transferTextLbl: UILabel = UILabel().parent(mainView)
    
    lazy var mainStack: UIStackView = UIStackView().parent(mainView)
    let payeeBtn = UIButton()
    let amountTF = FormTextFieldView(title: "Amount", placeholder: "Insert amount ...", type: .amount)
    let descriptionTV = UITextView()
    
    lazy var errorView: ErrorMessageView = ErrorMessageView().parent(mainView)
    lazy var transferBtn: CustomButton = CustomButton(title: "Transfer Now").parent(mainView)
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        payeeBtn.parent(mainView)
        addSubview(mainView)
        mainStack.setupArrangedSubviews(payeeBtn, amountTF, descriptionTV)
        
        setupView()
        setupConstraints()
        setupText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupText() {
        transferTextLbl.text = "Transfer"
    }
    
    func setupView() {
        transferTextLbl.font = UIFont.boldSystemFont(ofSize: 24)
        
        
    }
    
    func setupConstraints() {
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        transferTextLbl.snp.makeConstraints { make in
            make.top.equalTo(mainView).offset(30)
            make.leading.equalTo(mainView).offset(30)
        }
        
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(transferTextLbl.snp.bottom).offset(60)
            make.leading.equalTo(mainView).offset(30)
            make.trailing.equalTo(mainView).offset(-30)
        }
        
        descriptionTV.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        transferBtn.snp.makeConstraints { make in
            make.leading.trailing.equalTo(payeeBtn)
            make.bottom.equalTo(mainView).offset(-30)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}

