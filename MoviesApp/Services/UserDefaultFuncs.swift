//
//  UserDefaultFuncs.swift
//  MoviesApp
//
//  Created by Fatih Özen on 27.06.2024.
//

import Foundation

final class UserDefaultFuncs {
    
    static let shared = UserDefaultFuncs()
    
    private init() {}
    
    func loadMovies() -> [MovieResult]? {
        let loadedMovies = UserDefaults.standard.value([MovieResult].self, forKey: "movieDataList")
        return loadedMovies
        
    }
    
    func saveMovies(_ movies: [MovieResult]) -> Data? {
        if let data = try? JSONEncoder().encode(movies) {
            return data
        }
        return nil
    }
    
    // MARK: - SHOWS
    
    func loadShows() -> [TVResult]? {
        if let loadedMovies = UserDefaults.standard.value([TVResult].self, forKey: "showDataList") {
            return loadedMovies
        }
        return nil
    }
    
    func saveShows(_ movies: [TVResult]) -> Data? {
        if let data = try? JSONEncoder().encode(movies) {
            return data
        }
        return nil
    }
}
