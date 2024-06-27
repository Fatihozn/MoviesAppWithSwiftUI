//
//  DetailViewModel.swift
//  MoviesApp
//
//  Created by Fatih Özen on 24.06.2024.
//

import Foundation

final class MovieDetailViewModel: ObservableObject {
    private let service = MovieService()
    
    @Published var movie: MovieResult = MovieResult()
    @Published var similarMovies: [MovieResult] = []
    @Published var castList: [CastResult] = []
    @Published var video: VideoResult = VideoResult()
    
    
    func getDetailMovie(id: Int, completion: @escaping (Bool) -> ()) {
        service.getDetailMovie(url: APIURLs.getDetailMovie(id: id)) { [weak self] movie in
            guard let self else { return }
            guard let movie else { return }
            
            DispatchQueue.main.async {
                self.movie = movie
            }
            
            
            if let movieList = UserDefaultFuncs.shared.loadMovies(), movieList != [] {
                if movieList.contains(movie) {
                    completion(true)
                } else {
                    completion(false)
                }
            } else {
                completion(false)
            }
           
            
        }
        
        service.downloadMovies(url: APIURLs.getSimilarMovies(id: id, page: 1)) { [weak self] movies in
            guard let self else { return }
            guard let movies else { return }
            
            DispatchQueue.main.async {
                self.similarMovies = movies
            }
            
        }
        
        service.getCasts(url: APIURLs.getCastMovie(id: id)) { [weak self] castList in
            guard let self else { return }
            guard let castList else { return }
            
            DispatchQueue.main.async {
                self.castList = castList
            }
        }
        
        service.getVideo(url: APIURLs.getVideoUrlMovie(id: id)) { [weak self] video in
            guard let self else { return }
            guard let video else { return }
            
            DispatchQueue.main.async {
                self.video = video
            }
        }
        
    }
}
