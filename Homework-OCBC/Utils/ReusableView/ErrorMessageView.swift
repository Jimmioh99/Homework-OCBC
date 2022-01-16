//
//  ErrorMessageView.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit

class ErrorMessageView: UIView {
    
    let textLbl = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textLbl)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
    }
    
    func setupConstraints() {
        textLbl.snp.makeConstraints { make in
            make.top.leading.equalTo(self).offset(20)
            make.trailing.bottom.equalTo(self).offset(-20)
        }
    }
}
