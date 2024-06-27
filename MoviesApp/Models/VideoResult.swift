//
//  VideoResult.swift
//  MoviesApp
//
//  Created by Fatih Özen on 25.06.2024.
//

import Foundation

struct Video: Decodable {
    var id: Int?
    var results: [VideoResult]?
    
    var _results: [VideoResult] {
        results ?? []
    }
}

struct VideoResult: Decodable {
    var key: String?
    
    var _key: String {
        key ?? ""
    }
}
