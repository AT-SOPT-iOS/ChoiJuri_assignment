//
//  TodayModel.swift
//  TVING_SwiftUI
//
//  Created by 최주리 on 5/28/25.
//

import SwiftUI

struct TodayModel: Hashable {
    let rank: Int
    let image: ImageResource
}

extension TodayModel {
    static func mock() -> [TodayModel] {
        return [
            .init(rank: 1, image: .movie1),
            .init(rank: 2, image: .movie2),
            .init(rank: 3, image: .movie1),
            .init(rank: 4, image: .movie2),
            .init(rank: 5, image: .movie1),
            .init(rank: 6, image: .movie2),
            .init(rank: 7, image: .movie1)
        ]
    }
}

struct LiveModel: Hashable {
    let rank: Int
    let title: String
    let percentage: Float
    let description: String
    let image: ImageResource
}

extension LiveModel {
    static func mock() -> [LiveModel] {
        return [
            .init(
                rank: 1,
                title: "JTBC",
                percentage: 27.2,
                description: "이혼숙려캠프 34화",
                image: .live1
            ),
            .init(
                rank: 2,
                title: "뿅뿅지구오락실",
                percentage: 24.1,
                description: "14화",
                image: .live2
            ),
            .init(
                rank: 3,
                title: "JTBC",
                percentage: 22.2,
                description: "이혼숙려캠프 34화",
                image: .live1
            ),
            .init(
                rank: 4,
                title: "뿅뿅지구오락실",
                percentage: 20.1,
                description: "14화",
                image: .live2
            )
        ]
    }
}

struct ImageModel: Hashable {
    let image: ImageResource
}

extension ImageModel {
    static func movieMock() -> [ImageModel] {
        return [
            .init(image: .movie1),
            .init(image: .movie2),
            .init(image: .movie1),
            .init(image: .movie2),
            .init(image: .movie1)
        ]
    }
    
    static func baseballMock() -> [ImageModel] {
        return [
            .init(image: .baseball1),
            .init(image: .baseball2),
            .init(image: .baseball1),
            .init(image: .baseball1),
            .init(image: .baseball2),
            .init(image: .baseball2),
            .init(image: .baseball1)
        ]
    }
    
    static func categoryMock() -> [ImageModel] {
        return [
            .init(image: .caegory1),
            .init(image: .category2),
            .init(image: .category3),
            .init(image: .caegory1),
            .init(image: .category2),
            .init(image: .category3)
        ]
    }
    
    static func dramaMock() -> [ImageModel] {
        return [
            .init(image: .drama1),
            .init(image: .drama2),
            .init(image: .drama1),
            .init(image: .drama2),
            .init(image: .drama1)
        ]
    }
}
