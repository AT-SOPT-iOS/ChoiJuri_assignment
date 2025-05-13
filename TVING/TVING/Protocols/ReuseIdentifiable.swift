//
//  ReuseIdentifiable.swift
//  TVING
//
//  Created by 최주리 on 5/13/25.
//

import Foundation

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
