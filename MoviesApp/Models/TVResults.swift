//
//  TVResults.swift
//  MoviesApp
//
//  Created by Fatih Özen on 26.06.2024.
//

import Foundation

struct TV: Codable {
    
    var results: [TVResult]?
}

struct TVResult: Codable, Identifiable, Hashable {
    var id, Seasons, episodes: Int?
    var posterPath, name, firstAirDate, overview: String?
    var genres: [Genre]?
    var voteAverage: Double?
    
    
    // Hashable protokolü için hash(into:) metodunu implement edin
      func hash(into hasher: inout Hasher) {
          hasher.combine(id)
      }
      
      // Equatable protokolü için == operatörünü implement edin
      static func == (lhs: TVResult, rhs: TVResult) -> Bool {
          return lhs.id == rhs.id
      }
    
    enum CodingKeys: String, CodingKey {
        case id
        case Seasons = "number_of_seasons"
        case episodes = "number_of_episodes"
        case posterPath = "poster_path"
        case name
        case firstAirDate = "first_air_date"
        case genres
        case voteAverage = "vote_avarage"
        case overview
    }
    
    var _id: Int {
        id ?? Int.min
    }
    
    var _posterPath: String {
        posterPath ?? ""
    }
    
    var _overview: String {
        overview ?? "There is no overview"
    }
    
    var _voteAverage: Double {
        voteAverage ?? 0
    }
    
    var _genres: [Genre] {
        genres ?? []
    }
    
    var _name: String {
        name ?? "There is no name"
    }
    
    var _firstAirDate: String {
        firstAirDate ?? "There is no date"
    }
    
    var _Seasons: Int {
        Seasons ?? 0
    }
    
    var _episodes: Int {
        episodes ?? 0
    }
    
}

