//
//  TransactionTableCell.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 16/01/22.
//

import UIKit
import SnapKit

class TransactionTableCell: UITableViewCell {
    
    lazy var nameLbl = UILabel().parent(contentView)
    lazy var accountNumberLbl = UILabel().parent(contentView)
    lazy var amountLbl = UILabel().parent(contentView)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        
        setupConstraints()
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        selectionStyle = .none
        
        nameLbl.font = UIFont.boldSystemFont(ofSize: 18)
        
        accountNumberLbl.textColor = UIColor.gray
        accountNumberLbl.font = UIFont.boldSystemFont(ofSize: 16)
        
        amountLbl.font = UIFont.boldSystemFont(ofSize: 20)
        
    }
    
    func setupConstraints() {
        nameLbl.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.leading.equalTo(contentView).offset(20)
        }
        
        accountNumberLbl.snp.makeConstraints { make in
            make.top.equalTo(nameLbl.snp.bottom)
            make.leading.equalTo(nameLbl)
            make.bottom.equalTo(contentView)
        }
        
        amountLbl.snp.makeConstraints { make in
            make.top.equalTo(nameLbl)
            make.trailing.equalTo(contentView).offset(-20)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
