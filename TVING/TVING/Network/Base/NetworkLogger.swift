//
//  NetworkLogger.swift
//  TVING
//
//  Created by 최주리 on 5/13/25.
//

import Foundation

final class NetworkLogger {
    static let shared = NetworkLogger()
    private init() { }
    
    static func requestLog(request: URLRequest) {
        print("\n⏰ request ⏰\n")
        defer {
            print("\n")
        }
        
        let url = request.url?.absoluteString ?? "URL None"
        let method = request.httpMethod
        
        var output = """
            url: \(url)
            method: \(String(describing: method))
        
        """
        
        for (key,value) in request.allHTTPHeaderFields ?? [:] {
            output += "\(key): \(value) \n"
        }
        
        if let body = request.httpBody {
            output += "\n \(String(data: body, encoding: .utf8) ?? "")"
        }
        
        print(output)
    }
    
    static func responseLog(response: HTTPURLResponse?, data: Data?) {
        print("\n🌀 response 🌀\n")
        defer {
            print("\n")
        }
        
        var output = ""
        
        if let statusCode = response?.statusCode {
            output += "✅ Status Code: \(statusCode)"
        }
        
        if let body = data {
            output += "\n✅ Body: \(String(data: body, encoding: .utf8) ?? "")\n"
        }
        
        print(output)
    }
}
