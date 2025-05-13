//
//  FetchMovieService.swift
//  TVING
//
//  Created by 최주리 on 5/13/25.
//

import Foundation

protocol FetchMovie {
    func fetchMovie(date: String) async throws -> MovieChartResponse
}

final class DefaultFetchMovieService: FetchMovie {
    private let network = BaseService.shared
    
    func fetchMovie(date: String) async throws -> MovieChartResponse {
        let url = Endpoint.fetchMovie(date: date).url
        
        return try await network.getRequest(url: url)
    }
}

final class MockFetchMovieService: FetchMovie {
    func fetchMovie(date: String) async throws -> MovieChartResponse {
        return .init(
            boxOfficeResult: .init(
                boxofficeType: "",
                showRange: "",
                dailyBoxOfficeList: [
                    .init(rank: "1", movieNm: "영화 이름1", openDt: "2024-11-11"),
                ]
            )
        )
    }
}
