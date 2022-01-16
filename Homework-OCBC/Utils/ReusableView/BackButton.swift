//
//  BackButton.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class BackButton: UIButton {
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        setImage(UIImage(named: "ic_back"), for: .normal)
    }
    
    func setupConstraints() {
        self.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
    }
    
    
}
