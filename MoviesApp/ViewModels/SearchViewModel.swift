//
//  SearchViewModel.swift
//  MoviesApp
//
//  Created by Fatih Özen on 26.06.2024.
//

import Foundation

final class SearchViewModel: ObservableObject {
    private var service = MovieService()
    
    @Published var movieSearchedList: [MovieResult] = []
    @Published var showSearchedList: [TVResult] = []
    
    func getTrendingList() {
        service.downloadMovies(url: APIURLs.getMovieTrending()) { [weak self] movies in
            guard let self else { return }
            guard let movies else { return }
            
            DispatchQueue.main.async {
                self.movieSearchedList = movies
            }
            
        }
        
        service.downloadTVs(url: APIURLs.getTvTrending()) { [weak self] shows in
            guard let self else { return }
            guard let shows else { return }
            
            DispatchQueue.main.async {
                self.showSearchedList = shows
            }
            
        }
    }
    
    func getSearchedList(text: String) {
        service.downloadMovies(url: APIURLs.getMovieSearch(text: text)) { [weak self] movies in
            guard let self else { return }
            guard let movies else { return }
            
            DispatchQueue.main.async {
                self.movieSearchedList = movies
            }
        }
        
        service.downloadTVs(url: APIURLs.getTvSearch(text: text)) { [weak self] shows in
            guard let self else { return }
            guard let shows else { return }
            
            DispatchQueue.main.async {
                self.showSearchedList = shows
            }
        }
    }
    
}
