//
//  MoviesViewModels.swift
//  MoviesApp
//
//  Created by Fatih Özen on 24.06.2024.
//

import Foundation

final class ListPageViewModel: ObservableObject {
    private let service = MovieService()
    
    @Published var movieLists: [String: [MovieResult]] = ["Now Playing": [], "Popular": [], "Top Rated": [], "Upcoming": []]
    @Published var tvLists: [String: [TVResult]] = ["On The Air": [], "Popular": [], "Top Rated": [], "Airing Today": []]
    
    func getMovieLists() {
        service.downloadMovies(url: APIURLs.getNowPlayingMovies(page: 1)) { [weak self] resultList in
            guard let self else { return }
            guard let resultList else { return }
            
            DispatchQueue.main.async {
                self.movieLists["Now Playing"] = resultList
            }
        }
        
        service.downloadMovies(url: APIURLs.getPopularMovies(page: 1)) { [weak self] resultList in
            guard let self else { return }
            guard let resultList else { return }
            
            DispatchQueue.main.async {
                self.movieLists["Popular"] = resultList
            }
        }
        
        service.downloadMovies(url: APIURLs.getTopRatedMovies(page: 1)) { [weak self] resultList in
            guard let self else { return }
            guard let resultList else { return }
            
            DispatchQueue.main.async {
                self.movieLists["Top Rated"] = resultList
            }
        }
        
        service.downloadMovies(url: APIURLs.getUpcomingMovies(page: 1)) { [weak self] resultList in
            guard let self else { return }
            guard let resultList else { return }
            
            DispatchQueue.main.async {
                self.movieLists["Upcoming"] = resultList
            }
        }
    }
    
    
    //MARK: --  GET TV LİSTS
    
    func getTVLists() {
        service.downloadTVs(url: APIURLs.getOnTheAirTV(page: 1)) { [weak self] resultList in
            guard let self else { return }
            guard let resultList else { return }
            
            DispatchQueue.main.async {
                self.tvLists["On The Air"] = resultList
            }
        }
        
        service.downloadTVs(url: APIURLs.getPopularTV(page: 1)) { [weak self] resultList in
            guard let self else { return }
            guard let resultList else { return }
            
            DispatchQueue.main.async {
                self.tvLists["Popular"] = resultList
            }
        }
        
        service.downloadTVs(url: APIURLs.getTopRatedTV(page: 1)) { [weak self] resultList in
            guard let self else { return }
            guard let resultList else { return }
            
            DispatchQueue.main.async {
                self.tvLists["Top Rated"] = resultList
            }
        }
        
        service.downloadTVs(url: APIURLs.getAiringTodayTV(page: 1)) { [weak self] resultList in
            guard let self else { return }
            guard let resultList else { return }
            
            DispatchQueue.main.async {
                self.tvLists["Airing Today"] = resultList
            }
        }
        
    }
}
