//
//  APIurls.swift
//  MoviesApp
//
//  Created by Fatih Özen on 24.06.2024.

import Foundation

enum APIURLs {
    
    static func getPopularMovies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US&page=\(page)"
    }
    
    static func getNowPlayingMovies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/now_playing?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US&page=\(page)"
    }
    
    static func getUpcomingMovies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/upcoming?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US&page=\(page)"
    }
    
    static func getTopRatedMovies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/top_rated?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US&page=\(page)"
    }
    
    static func getPopularTV(page: Int) -> String {
        "https://api.themoviedb.org/3/tv/popular?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US&page=\(page)"
    }
    
    static func getOnTheAirTV(page: Int) -> String {
        "https://api.themoviedb.org/3/tv/airing_today?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US&page=\(page)"
    }
    
    static func getAiringTodayTV(page: Int) -> String {
        "https://api.themoviedb.org/3/tv/on_the_air?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US&page=\(page)"
    }
    
    static func getTopRatedTV(page: Int) -> String {
        "https://api.themoviedb.org/3/tv/top_rated?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US&page=\(page)"
    }
    
    // MARK: --
    
    static func downloadImage(posterPath: String) -> String {
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    static func getVideoUrlMovie(id: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=adc8a5bdc6760c74947ac29f385ebd15"
    }
    
    static func getVideoUrlTV(id: Int) -> String {
        "https://api.themoviedb.org/3/tv/\(id)/videos?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US"
    }
    
    // MARK: -- Details
    
    static func getDetailMovie(id: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US"
    }
    
    static func getDetailTV(id: Int) -> String {
        "https://api.themoviedb.org/3/tv/\(id)?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US"
    }
    
    static func getCastDetail(id: Int) -> String {
        "https://api.themoviedb.org/3/person/\(id)?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US"
    }
    
    // MARK: -
    
    static func getCastTV(id: Int) -> String {
        "https://api.themoviedb.org/3/tv/\(id)/credits?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US"
    }
    
    static func getCastMovie(id: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)/credits?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US"
    }
    
    static func getSimilarMovies(id: Int, page: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)/similar?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US&page=\(page)"
    }
    
    static func getSimilarTV(id: Int, page: Int) -> String {
        "https://api.themoviedb.org/3/tv/\(id)/similar?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US&page=\(page)"
    }
    
    
    // --------
    static func getMovieSearch(text: String) -> String {
        "https://api.themoviedb.org/3/search/movie?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US&query=\(text)&page=1&include_adult=false"
    }
    
    static func getTvSearch(text: String) -> String {
        "https://api.themoviedb.org/3/search/tv?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US&query=\(text)&page=1&include_adult=false"
    }
    
    static func getMovieTrending() -> String {
        "https://api.themoviedb.org/3/trending/movie/day?api_key=adc8a5bdc6760c74947ac29f385ebd15"
    }
    
    static func getTvTrending() -> String {
        "https://api.themoviedb.org/3/trending/tv/day?api_key=adc8a5bdc6760c74947ac29f385ebd15"
    }
    // --------
    
    
    static func getTVCredits(id: Int) -> String {
        "https://api.themoviedb.org/3/person/\(id)/tv_credits?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US"
    }
    
    static func getMovieCredits(id: Int) -> String {
        "https://api.themoviedb.org/3/person/\(id)/movie_credits?api_key=adc8a5bdc6760c74947ac29f385ebd15&language=en-US"
    }
}
