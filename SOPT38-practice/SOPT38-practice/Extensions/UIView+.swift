//
//  UIView+.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 5/2/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

