//
//  FetchMovieService.swift
//  TVING
//
//  Created by 최주리 on 5/13/25.
//

import Foundation

final class FetchMovieService {
    private let network = BaseService.shared
    
    func fetchMovie(date: String) async throws -> MovieChartResponse {
        let url = Endpoint.fetchMovie(date: date).url
        
        return try await network.getRequest(url: url)
    }
}
