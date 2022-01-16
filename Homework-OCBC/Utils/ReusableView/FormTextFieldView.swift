//
//  FormTextFieldView.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class FormTextFieldView: UIView {
    
    let mainStack = UIStackView()
    let formView = UIView()
    let formStack = UIStackView()
    let titleTextLbl = UILabel()
    let formTF = UITextField()
    let button = UIButton()
    let errorLbl = UILabel()
    
    var disposeBag = DisposeBag()
    
    init(title: String, placeholder: String, type: FormTextFieldEnum) {
        super.init(frame: CGRect.zero)
        
        addSubview(mainStack)
        mainStack.setupArrangedSubviews([formView, errorLbl])
        formView.setupSubviews([formStack, button])
        formStack.setupArrangedSubviews([titleTextLbl, formTF])
        
        initialize(title: title, placeholder: placeholder, type: type)
        
        setupConstraints()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize(title: String, placeholder: String, type: FormTextFieldEnum) {
        titleTextLbl.text = title
        formTF.placeholder = placeholder
        
        formTF.isSecureTextEntry = type == .password
        
        formTF.keyboardType = type == .amount ? .numberPad : .default
        
    }
    
    func setError(error: String = "") {
        errorLbl.text = error
        errorLbl.isHidden = error == ""
    }
    
    func setupView() {
        mainStack.axis = .vertical
        
        formView.setLayer(cornerRadius: 0, borderWidth: 2, borderColor: .black)
        
        formStack.axis = .vertical
        formStack.spacing = 10
        formStack.alignment = .leading
        
        titleTextLbl.isHidden = true
        titleTextLbl.font = UIFont.boldSystemFont(ofSize: 16)
        
        formTF.autocorrectionType = .no
        formTF.font = UIFont.systemFont(ofSize: 14)
        
        formTF.rx.text.changed.subscribe(onNext: { (text) in
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                self?.titleTextLbl.isHidden = !(text != nil && text != "")
            }, completion: nil)
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        button.rx.tap.subscribe(onNext: { [weak self] in
            self?.formTF.becomeFirstResponder()
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        errorLbl.textColor = .red
    }
    
    func setupConstraints() {
        
        mainStack.snp.makeConstraints { make in
            make.top.leading.equalTo(self)
            make.trailing.bottom.equalTo(self)
        }
        
        formStack.snp.makeConstraints { make in
            make.top.leading.equalTo(formView).offset(20)
            make.trailing.bottom.equalTo(formView).offset(-20)
        }
        
        button.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(formView)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
