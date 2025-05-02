//
//  SportsModel.swift
//  TVING
//
//  Created by 최주리 on 5/1/25.
//

import UIKit

struct SportsModel {
    let image: UIImage
}

extension SportsModel {
    static func mock() -> [SportsModel] {
        return [
            .init(image: .appleTV),
            .init(image: .kbo),
            .init(image: .kbl),
            .init(image: .afc),
            .init(image: .appleTV),
        ]
    }
}
