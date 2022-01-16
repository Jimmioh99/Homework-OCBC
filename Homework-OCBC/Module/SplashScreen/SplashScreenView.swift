//
//  SplashScreenView.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import SnapKit

class SplashScreenView: UIView {
    
    lazy var iconImage = UIImageView().parent(self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupView()
        setupConstraints()
        setupText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupText() {
        
    }
    
    func setupView() {
        iconImage.image = UIImage(named: "ic_logo")
    }
    
    func setupConstraints() {
        
        iconImage.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.size.equalTo(UIScreen.main.bounds.width / 2)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}


