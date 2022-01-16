//
//  UIStackView.swift
//  Homework-OCBC
//
//  Created by Jimmi Oh on 10/01/22.
//

import UIKit

extension UIStackView {
    public func setupArrangedSubviews(_ views: [UIView]) {
        for item in views {
            addArrangedSubview(item)
        }
    }
}
