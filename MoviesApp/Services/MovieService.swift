//
//  MovieService.swift
//  MoviesApp
//
//  Created by Fatih Özen on 24.06.2024.
//

import Foundation

final class MovieService {
    
    func downloadMovies(url: String, completion: @escaping ([MovieResult]?) -> () ) {
        guard let url = URL(string: url) else { return }
        
        NetworkManager.shared.downloadAF(url: url, httpMethod: .get) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
                
            case .failure(let error):
                self.handleWithError(error)
                
            }
            
        }
    }
    
    func getDetailMovie(url: String, completion: @escaping (MovieResult?) -> ()) {
        guard let url = URL(string: url) else { return }
        
        NetworkManager.shared.downloadAF(url: url, httpMethod: .get) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    func downloadTVs(url: String, completion: @escaping ([TVResult]?) -> () ) {
        guard let url = URL(string: url) else { return }
        
        NetworkManager.shared.downloadAF(url: url, httpMethod: .get) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
                
            case .failure(let error):
                self.handleWithError(error)
                
            }
            
        }
    }
    
    func getDetailTV(url: String, completion: @escaping (TVResult?) -> ()) {
        guard let url = URL(string: url) else { return }
        
        NetworkManager.shared.downloadAF(url: url, httpMethod: .get) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    func getCasts(url: String, completion: @escaping ([CastResult]?) -> ()) {
        guard let url = URL(string: url) else { return }
        
        NetworkManager.shared.downloadAF(url: url, httpMethod: .get) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    func getDetailCast(url: String, completion: @escaping (CastResult?) -> ()) {
        guard let url = URL(string: url) else { return }
        
        NetworkManager.shared.downloadAF(url: url, httpMethod: .get) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    func getMovieCredits(url: String, completion: @escaping ([MovieResult]?) -> ()) {
        guard let url = URL(string: url) else { return }
        
        NetworkManager.shared.downloadAF(url: url, httpMethod: .get) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithDataCast(data))
                
            case .failure(let error):
                self.handleWithError(error)
                
            }
        }
    }
    
    func getTVCredits(url: String, completion: @escaping ([TVResult]?) -> ()) {
        guard let url = URL(string: url) else { return }
        
        NetworkManager.shared.downloadAF(url: url, httpMethod: .get) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithDataCast(data))
                
            case .failure(let error):
                self.handleWithError(error)
                
            }
        }
    }
    
    func getVideo(url: String, completion: @escaping (VideoResult?) -> ()) {
        guard let url = URL(string: url) else { return }
        
        NetworkManager.shared.downloadAF(url: url, httpMethod: .get) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    
    
    
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    
    private func handleWithData(_ data: Data) -> [MovieResult]? {
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.results
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func handleWithData(_ data: Data) -> MovieResult? {
        do {
            let detail = try JSONDecoder().decode(MovieResult.self, from: data)
            return detail
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func handleWithData(_ data: Data) -> [TVResult]? {
        do {
            let tv = try JSONDecoder().decode(TV.self, from: data)
            return tv.results
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func handleWithData(_ data: Data) -> TVResult? {
        do {
            let detail = try JSONDecoder().decode(TVResult.self, from: data)
            return detail
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func handleWithData(_ data: Data) -> [CastResult]? {
        do {
            let cast = try JSONDecoder().decode(Cast.self, from: data)
            return cast.cast
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func handleWithData(_ data: Data) -> CastResult? {
        do {
            let castResult = try JSONDecoder().decode(CastResult.self, from: data)
            return castResult
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func handleWithDataCast(_ data: Data) -> [MovieResult]? {
        do {
            let movieResults = try JSONDecoder().decode(CastMovie.self, from: data)
            return movieResults.cast
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func handleWithDataCast(_ data: Data) -> [TVResult]? {
        do {
            let movieResults = try JSONDecoder().decode(CastTV.self, from: data)
            return movieResults.cast
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func handleWithData(_ data: Data) -> VideoResult? {
        do {
            let video = try JSONDecoder().decode(Video.self, from: data)
            return video._results.first
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
