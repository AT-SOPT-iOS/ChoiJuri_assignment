//
//  UIView+.swift
//  TVING
//
//  Created by 최주리 on 4/21/25.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    func makeBorder(
        width: CGFloat,
        color: UIColor,
        cornerRadius: CGFloat = 0
    ) {
        clipsToBounds = true
        layer.borderWidth = width
        layer.cornerRadius = cornerRadius
        layer.borderColor = color.cgColor
    }
}
