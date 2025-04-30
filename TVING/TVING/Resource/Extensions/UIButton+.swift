//
//  UIButton+.swift
//  TVING
//
//  Created by 최주리 on 4/21/25.
//

import UIKit

extension UIButton {
    func setUnderLine() {
        guard let title = title(for: .normal)  else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}
