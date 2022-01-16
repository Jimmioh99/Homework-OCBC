//
//  TransactionHeaderView.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import Foundation
import UIKit

class TransactionHeaderView: UIView {
    
    lazy var dateLbl = UILabel().parent(self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        
        setupConstraints()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addCorners(radius: 10, corners: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
        
        dateLbl.font = UIFont.boldSystemFont(ofSize: 18)
        dateLbl.textColor = UIColor.darkGray
    }
    
    func setupConstraints() {
        
        dateLbl.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.leading.equalTo(self).offset(20)
            make.bottom.equalTo(self)//.offset(-10)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
