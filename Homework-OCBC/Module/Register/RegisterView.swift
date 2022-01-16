//
//  RegisterView.swift
//  Registerwork-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import SnapKit

class RegisterView: UIView {
    
    let mainView = UIView()
    
    let backBtn = BackButton()
    
    let registerTextLbl = UILabel()
    
    let mainStack = UIStackView()
    let usernameTF = FormTextFieldView(title: "Username", placeholder: "Insert your username ...", type: .name)
    let passwordTF = FormTextFieldView(title: "Password", placeholder: "Insert your password ...", type: .password)
    let currentPasswordTF = FormTextFieldView(title: "Current Password", placeholder: "Insert your current password ...", type: .password)
    
    let errorView: ErrorMessageView = ErrorMessageView()
    
    let registerBtn = CustomButton(title: "Register")
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(mainView)
        mainView.setupSubviews([backBtn, registerTextLbl, mainStack, registerBtn])
        mainStack.setupArrangedSubviews(usernameTF, passwordTF, currentPasswordTF, errorView)
        
        setupView()
        setupConstraints()
        setupText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupText() {
        registerTextLbl.text = "Register"
    }
    
    func setupView() {
        registerTextLbl.font = UIFont.boldSystemFont(ofSize: 32)
        
        mainStack.axis = .vertical
        mainStack.spacing = 20
        
        errorView.isHidden = true
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
        
        registerTextLbl.snp.makeConstraints { make in
            make.top.equalTo(backBtn.snp.bottom).offset(30)
            make.leading.equalTo(mainView).offset(30)
        }
        
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(registerTextLbl.snp.bottom).offset(60)
            make.leading.equalTo(mainView).offset(30)
            make.trailing.equalTo(mainView).offset(-30)
        }
        
        registerBtn.snp.makeConstraints { make in
            make.leading.trailing.equalTo(usernameTF)
            make.bottom.equalTo(mainView).offset(-30)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}

