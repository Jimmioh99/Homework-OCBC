//
//  SelectButton.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import Foundation
import UIKit

class SelectButton: UIButton {
    
    let mainView = UIView()
    
    lazy var titleTextLbl = UILabel().parent(mainView)
    
    lazy var resultLbl = UILabel().parent(mainView)
    lazy var selectIconImage = UIImageView().parent(mainView)
    
    init(title: String) {
        super.init(frame: CGRect())
        
        addSubview(mainView)
        
        titleTextLbl.text = title
            
        setupConstraints()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setLayer(cornerRadius: 0, borderWidth: 2, borderColor: .black)
        
        resultLbl.font = UIFont.boldSystemFont(ofSize: 20)
        resultLbl.text = "Select ..."
        
        selectIconImage.image = UIImage(named: "ic_dropdown")
    }
    
    func setupConstraints() {
        titleTextLbl.snp.makeConstraints { make in
            make.top.leading.equalTo(self).offset(20)
        }
        
        resultLbl.snp.makeConstraints { make in
            make.top.equalTo(titleTextLbl.snp.bottom).offset(10)
            make.leading.equalTo(titleTextLbl)
            make.trailing.equalTo(selectIconImage.snp.leading)
            make.bottom.equalTo(self).offset(-20)
        }
        
        selectIconImage.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.trailing.equalTo(self).offset(-20)
            make.size.equalTo(20)
        }
    }
    
    
}
