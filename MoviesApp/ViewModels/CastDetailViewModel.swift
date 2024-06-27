//
//  CastDetailViewModel.swift
//  MoviesApp
//
//  Created by Fatih Özen on 25.06.2024.
//

import Foundation

final class CastDetailViewModel: ObservableObject {
    private var service = MovieService()
    
    @Published var cast: CastResult = CastResult()
    @Published var movieCredits: [MovieResult] = []
    @Published var tvCredits: [TVResult] = []
    
    func getDetailCast(id: Int) {
        service.getDetailCast(url: APIURLs.getCastDetail(id: id)) { [weak self] castDetail in
            guard let self else { return }
            guard let castDetail else { return }
            
            DispatchQueue.main.async {
                self.cast = castDetail
            }
        }
        
        service.getMovieCredits(url: APIURLs.getMovieCredits(id: id)) { [weak self] movies in
            guard let self else { return }
            guard let movies else { return }
            
            DispatchQueue.main.async {
                self.movieCredits = movies
            }
            
        }
        
        service.getTVCredits(url: APIURLs.getTVCredits(id: id)) { [weak self] tvs in
            guard let self else { return }
            guard let tvs else { return }
            
            DispatchQueue.main.async {
                self.tvCredits = tvs
            }
            
        }
        
    }
}
