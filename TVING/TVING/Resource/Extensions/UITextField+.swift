//
//  UITextField+.swift
//  TVING
//
//  Created by 최주리 on 4/21/25.
//

import UIKit

extension UITextField {
    func setPlaceholder(
        placeholder: String,
        fontColor: UIColor?,
        font: UIFont
    ) {
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: fontColor!,
                         .font: font]
        )
    }
    
    func addPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
        if let left {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: 0))
            leftViewMode = .always
        }
        if let right {
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: 0))
            rightViewMode = .always
        }
    }
}
