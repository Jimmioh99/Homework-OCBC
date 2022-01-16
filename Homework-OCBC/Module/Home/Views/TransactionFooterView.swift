//
//  TransactionFooterView.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import Foundation
import UIKit
import SnapKit

class TransactionFooterView: UIView {
    
    lazy var mainView = UIView().parent(self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        mainView.addCorners(radius: 10, corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        mainView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
    }
    
    func setupConstraints() {
        
        mainView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.bottom.equalTo(self).offset(-10)
            make.height.equalTo(20)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
