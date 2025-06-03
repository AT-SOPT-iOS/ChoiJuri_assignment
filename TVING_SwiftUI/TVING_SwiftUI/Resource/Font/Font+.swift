//
//  Font+.swift
//  TVING_SwiftUI
//
//  Created by 최주리 on 5/28/25.
//

import SwiftUI

enum FontName: String {
    case pretendardBold = "Pretendard-Bold"
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardMedium = "Pretendard-Medium"
}

extension Font {
    static func font(_ style: FontName, ofSize size: CGFloat) -> Font {
        return Font.custom(style.rawValue, size: size)
    }
}
