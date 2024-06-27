//
//  WatchingList.swift
//  MoviesApp
//
//  Created by Fatih Özen on 26.06.2024.
//

import SwiftUI
import Kingfisher

struct WatchingList: View {
    @State var path = NavigationPath()
    
    @AppStorage("movieDataList") private var movieDataList: Data = Data()
    @AppStorage("showDataList") private var tvDataList: Data = Data()
    
    @State private var movieList: [MovieResult] = []
    @State private var showsList: [TVResult] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                Section {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 20) {
                        ForEach(movieList) { movie in
                            NavigationLink(value: movie) {
                                
                                Group {
                                    if movie._posterPath == "" {
                                        Image(systemName: "film")
                                    } else {
                                        KFImage(URL(string: APIURLs.downloadImage(posterPath: movie._posterPath)))
                                            .resizable()
                                    }
                                }
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                
                                
                            }
                        }
                    }
                    .padding(5)
                } header: {
                    Text("Movie List")
                        .font(.system(size: 28, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                }
                
                Section {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 20) {
                        ForEach(showsList) { show in
                            NavigationLink(value: show) {
                                
                                Group {
                                    if show._posterPath == "" {
                                        Image(systemName: "film")
                                    } else {
                                        KFImage(URL(string: APIURLs.downloadImage(posterPath: show._posterPath)))
                                            .resizable()
                                    }
                                }
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                
                                
                            }
                        }
                    }
                    .padding(5)
                } header: {
                    Text("Show List")
                        .font(.system(size: 28, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                }
                
            }
            .onAppear {
                if let movies = UserDefaultFuncs.shared.loadMovies() {
                    movieList = movies
                }
                
                if let shows = UserDefaultFuncs.shared.loadShows() {
                    showsList = shows
                }
            }
            .navigationDestination(for: MovieResult.self) { movie in
                MovieDetailPage(path: $path, id: movie._id)
            }
            .navigationDestination(for: CastResult.self) { cast in
                CastDetailPage(path: $path, id: cast._id)
            }
            .navigationDestination(for: TVResult.self) { tv in
                TVDetailPage(path: $path, id: tv._id)
            }
            
        }
    }
}
