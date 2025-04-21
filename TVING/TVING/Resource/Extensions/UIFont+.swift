//
//  UIFont+.swift
//  TVING
//
//  Created by 최주리 on 4/21/25.
//

import UIKit

enum FontName: String {
    case pretendardBold = "Pretendard-Bold" //700
    case pretendardLight = "Pretendard-Light" //400
    case pretendardMedium = "Pretendard-Medium" //500
    case pretendardSemiBold = "Pretendard-SemiBold" //600
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: style.rawValue, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        
        return customFont
    }
}
