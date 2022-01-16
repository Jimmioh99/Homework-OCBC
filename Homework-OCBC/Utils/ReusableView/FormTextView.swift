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

class FormTextView: UIView {
    
    let mainStack = UIStackView()
    let titleTextLbl = UILabel()
    let formTV = UITextView()
//    let button = UIButton()
    
    var disposeBag = DisposeBag()
    
    init(title: String) {
        super.init(frame: CGRect.zero)
        
        addSubview(mainStack)
        mainStack.setupArrangedSubviews(titleTextLbl, formTV)
        
        initialize(title: title)
        
        setupConstraints()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize(title: String) {
        titleTextLbl.text = title
        
    }
    
    func setupView() {
        mainStack.axis = .vertical
        
        setLayer(cornerRadius: 0, borderWidth: 2, borderColor: .black)
        
//        titleTextLbl.isHidden = true
        titleTextLbl.font = UIFont.boldSystemFont(ofSize: 16)
        
        formTV.autocorrectionType = .no
        formTV.font = UIFont.systemFont(ofSize: 14)
        
//        button.rx.tap.subscribe(onNext: { [weak self] in
//            self?.formTV.becomeFirstResponder()
//        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
    
    func setupConstraints() {
        
        mainStack.snp.makeConstraints { make in
            make.top.leading.equalTo(self).offset(20)
            make.trailing.bottom.equalTo(self).offset(-20)
        }
        
        formTV.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
