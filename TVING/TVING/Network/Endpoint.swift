//
//  Endpoint.swift
//  TVING
//
//  Created by 최주리 on 5/13/25.
//

import Foundation

enum RestAPIType {
    case get
    case post
}

enum Endpoint {
    case fetchMovie(date: String)
    
    var type: RestAPIType {
        switch self {
        case .fetchMovie:
            return .get
        }
    }
    
    var url: String {
        let url = Config.baseURL
        
        switch self {
        case .fetchMovie(let date):
            return url + "&targetDt=\(date)"
        }
    }
}
