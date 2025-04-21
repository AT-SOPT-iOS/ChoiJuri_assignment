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
    
    func makeCornerRadius(cornerRadius: CGFloat, maskedCorners: CACornerMask? = nil) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        
        if let maskedCorners {
            layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
        }
    }
    
    func makeBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
