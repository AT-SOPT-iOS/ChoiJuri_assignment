//
//  MoviewChartResponse.swift
//  TVING
//
//  Created by 최주리 on 5/13/25.
//

import Foundation

struct MovieChartResponse: Decodable {
    let boxOfficeResult: BoxOfficeResult
}

extension MovieChartResponse {
    struct BoxOfficeResult: Decodable {
        let boxofficeType: String
        let showRange: String
        let dailyBoxOfficeList: [DailyBoxOffice]
    }
}

extension MovieChartResponse.BoxOfficeResult {
    struct DailyBoxOffice: Decodable {
        let rank: String
        let movieNm: String
        let openDt: String
    }
}

extension MovieChartResponse {
    func toEntity() -> [Movie] {
        return boxOfficeResult.dailyBoxOfficeList.map {
            .init(
                rank: $0.rank,
                name: $0.movieNm,
                openDate: $0.openDt
            )
        }
    }
}
