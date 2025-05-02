//
//  TodayModel.swift
//  TVING
//
//  Created by 최주리 on 5/1/25.
//

import UIKit

struct TodayModel {
    let number: Int
    let image: UIImage
}

extension TodayModel {
    static func mock() -> [TodayModel] {
        return [
            .init(number: 1, image: .movie3),
            .init(number: 2, image: .movie2),
            .init(number: 3, image: .movie3),
            .init(number: 4, image: .movie4),
            .init(number: 5, image: .movie3),
            .init(number: 6, image: .movie2),
        ]
    }
}
