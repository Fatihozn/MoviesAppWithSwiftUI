//
//  MovieResult.swift
//  MoviesApp
//
//  Created by Fatih Özen on 24.06.2024.
//

import Foundation

struct Movie: Codable {
    
    var results: [MovieResult]?
}

struct MovieResult: Codable, Identifiable, Hashable {
    var id: Int?
    var posterPath: String?
    var title, overview, releaseDate: String?
    var genres: [Genre]?
    var voteAverage: Double?
    
    // Hashable protokolü için hash(into:) metodunu implement edin
      func hash(into hasher: inout Hasher) {
          hasher.combine(id)
      }
      
      // Equatable protokolü için == operatörünü implement edin
      static func == (lhs: MovieResult, rhs: MovieResult) -> Bool {
          return lhs.id == rhs.id
      }
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title // for movie
        case overview
        case releaseDate = "release_date"
        case genres
        case voteAverage = "vote_average"
    }
    
    var _id: Int {
        id ?? Int.min
    }
    
    var _posterPath: String {
        posterPath ?? ""
    }
    
    var _title: String {
        title ?? "There is no title"
    }
    
    var _overview: String {
        overview ?? "There is no overview"
    }
    
    var _releaseDate: String {
        releaseDate ?? "There is no date"
    }
    
    var _voteAverage: Double {
        voteAverage ?? 0
    }
    
    var _genres: [Genre] {
        genres ?? []
    }
    
}

struct Genre: Codable, Identifiable {
    var id: Int?
    var name: String?
    
    var _id: Int {
        id ?? Int.min
    }
    var _name: String {
        name ?? ""
    }
}


