//
//  LiveModel.swift
//  TVING
//
//  Created by 최주리 on 5/1/25.
//

import UIKit

struct LiveModel {
    let number: Int
    let company: String
    let title: String
    let percentage: String
    let image: UIImage
}

extension LiveModel {
    static func mock() -> [LiveModel] {
        return [
            .init(number: 1, company: "JTBC", title: "이혼숙려캠프 34화", percentage: "27.2%", image: .live1),
            .init(number: 2, company: "뿅뿅지구오락실", title: "14화", percentage: "24.1%", image: .live2),
            .init(number: 3, company: "시그널", title: "1화", percentage: "20%", image: .live3),
            .init(number: 4, company: "뿅뿅지구오락실", title: "환승연애 4화", percentage: "18.7%", image: .live4),
            .init(number: 5, company: "JTBC", title: "이혼숙려캠프 34화", percentage: "15.3%", image: .live5),
            .init(number: 6, company: "뿅뿅지구오락실", title: "10화", percentage: "9.7%", image: .live6),
        ]
    }
}
