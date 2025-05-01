//
//  Untitled.swift
//  TVING
//
//  Created by 최주리 on 5/2/25.
//

import UIKit

struct LifeModel {
    let image: UIImage
}

extension LifeModel {
    static func mock() -> [LifeModel] {
        return [
            .init(image: .live1),
            .init(image: .live2),
            .init(image: .live3),
            .init(image: .live4),
            .init(image: .live5)
        ]
    }
}
