//
//  LoginView.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import SnapKit

class LoginView: UIView {
    
    let mainView = UIView()
    
    let loginTextLbl = UILabel()
    
    let usernameTF = FormTextFieldView(title: "Username", placeholder: "Insert your username ...", type: .name)
    let passwordTF = FormTextFieldView(title: "Password", placeholder: "Insert your password ...", type: .password)
    
    let loginBtn = CustomButton(title: "Login")
    let registerBtn = CustomButton(title: "Register", type: .light)
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(mainView)
        mainView.setupSubviews([loginTextLbl, usernameTF, passwordTF, loginBtn, registerBtn])
        
        setupView()
        setupConstraints()
        setupText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupText() {
        loginTextLbl.text = "Login"
    }
    
    func setupView() {
        loginTextLbl.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    func setupConstraints() {
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        loginTextLbl.snp.makeConstraints { make in
            make.top.equalTo(mainView).offset(30)
            make.leading.equalTo(mainView).offset(30)
        }
        
        usernameTF.snp.makeConstraints { make in
            make.top.equalTo(loginTextLbl.snp.bottom).offset(60)
            make.leading.equalTo(mainView).offset(30)
            make.trailing.equalTo(mainView).offset(-30)
        }
        
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(usernameTF.snp.bottom).offset(20)
            make.leading.trailing.equalTo(usernameTF)
        }
        
        loginBtn.snp.makeConstraints { make in
            make.leading.trailing.equalTo(usernameTF)
            make.bottom.equalTo(registerBtn.snp.top).offset(-20)
        }
        
        registerBtn.snp.makeConstraints { make in
            make.leading.trailing.equalTo(usernameTF)
            make.bottom.equalTo(mainView).offset(-30)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}

