//
//  TVDetailViewModel.swift
//  MoviesApp
//
//  Created by Fatih Özen on 26.06.2024.
//

import Foundation

final class TVDetailViewModel: ObservableObject {
    private var service = MovieService()
    
    @Published var show: TVResult = TVResult()
    @Published var similarshows: [TVResult] = []
    @Published var castList: [CastResult] = []
    @Published var video: VideoResult = VideoResult()
    
    func getDetailTV(id: Int, completion: @escaping (Bool) -> ()) {
        service.getDetailTV(url: APIURLs.getDetailTV(id: id)) { [weak self] show in
            guard let self else { return }
            guard let show else { return }
            
            DispatchQueue.main.async {
                self.show = show
            }
            
            if let showList = UserDefaultFuncs.shared.loadShows(), showList != [] {
                if showList.contains(show) {
                    completion(true)
                } else {
                    completion(false)
                }
            } else {
                completion(false)
            }
            
        }
        
        service.downloadTVs(url: APIURLs.getSimilarTV(id: id, page: 1)) { [weak self] shows in
            guard let self else { return }
            guard let shows else { return }
            
            DispatchQueue.main.async {
                self.similarshows = shows
            }
            
        }
        
        service.getCasts(url: APIURLs.getCastTV(id: id)) { [weak self] castList in
            guard let self else { return }
            guard let castList else { return }
            
            DispatchQueue.main.async {
                self.castList = castList
            }
        }
        
        service.getVideo(url: APIURLs.getVideoUrlTV(id: id)) { [weak self] video in
            guard let self else { return }
            guard let video else { return }
            
            DispatchQueue.main.async {
                self.video = video
            }
        }
    }
}
