//
//  UIStackView+.swift
//  weatherAppBang
//
//  Created by 방민지 on 11/7/23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
