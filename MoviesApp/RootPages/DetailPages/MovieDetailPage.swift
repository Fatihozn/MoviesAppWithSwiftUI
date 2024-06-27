//
//  DetailPage.swift
//  MoviesApp
//
//  Created by Fatih Özen on 18.05.2024.
//

import SwiftUI
import Kingfisher

protocol MovieDetailPageProtocol {
    var view: MovieDetailPage { get set }
}

struct MovieDetailPage: View {
    
    @Binding var path: NavigationPath
    
    let id: Int
    let rows = [GridItem(.adaptive(minimum: 150, maximum: .infinity))]
    
    @StateObject private var viewModel = MovieDetailViewModel()
    
    @AppStorage("movieDataList") private var movieDataList: Data = Data()
    
    @State private var overViewLine = 2
    @State private var overViewText = "more.."
    @State private var genresText = ""
    @State private var buttonImage = "plus"
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 15) {
                HStack(alignment: .top) {
                    Group {
                        if viewModel.movie._posterPath == "" {
                            Image(systemName: "film")
                                .resizable()
                                .frame(width: 160, height: 180)
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                        } else {
                            KFImage(URL(string: APIURLs.downloadImage(posterPath: viewModel.movie._posterPath)))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 160, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.movie._title)
                            .font(.system(size: 22, weight: .bold))
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                        
                        HStack {
                            Image(systemName: "calendar")
                            Text(viewModel.movie._releaseDate)
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.secondary)
                        }
                        .padding(3)
                        
                        HStack {
                            Image(systemName: "film")
                            Text(viewModel.movie._genres.map { $0._name }.joined(separator: ", "))
                                .font(.system(size: 12, weight: .bold))
                                .foregroundStyle(.secondary)
                            
                        }
                        .padding(.horizontal, 3)
                        
                        HStack {
                            Image(systemName: "star.fill")
                            Text(String(viewModel.movie._voteAverage))
                                .font(.system(size: 12, weight: .bold))
                                .foregroundStyle(.secondary)
                        }
                        .padding(3)
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if viewModel.movie._overview != "" {
                    
                    VStack {
                        Text(viewModel.movie._overview)
                            .lineLimit(overViewLine == 2 ? 2 : nil)
                            .multilineTextAlignment(.leading)
                        
                        
                        Button {
                            withAnimation {
                                overViewLine = (overViewLine == 0 ? 2 : 0)
                                overViewText = (overViewLine == 0 ? "less.." : "more..")
                            }
                        } label: {
                            Text(overViewText)
                                .foregroundColor(.cyan)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                    }
                    .padding(3)
                    
                }
                
                if viewModel.video._key != "" {
                    YouTubePlayerView(videoID: viewModel.video._key)
                        .frame(height: 250)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
                
                
                VStack {
                    Section {
                        HorizontalCastListView(list: viewModel.castList)
                    } header: {
                        Text("Cast")
                            .font(.system(size: 24, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Section {
                        HorizontalMovieListView(list: viewModel.similarMovies)
                    } header: {
                        Text("Similar Movies")
                            .font(.system(size: 24, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                }
                
            }
            .padding(10)
            
            
        }
        .onAppear {
            
            viewModel.getDetailMovie(id: id) { isContain in
                buttonImage = updateButton(isContain: isContain)
            }
            
        }
        .navigationTitle("Movie Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    
                    if var movieList = UserDefaultFuncs.shared.loadMovies(), movieList != [] {
                        if let index = movieList.firstIndex(of: viewModel.movie) {
                            movieList.remove(at: index)
                            if let data = UserDefaultFuncs.shared.saveMovies(movieList) {
                                movieDataList = data
                                buttonImage = updateButton(isContain: false)
                            }
                            
                        } else {
                            movieList.append(viewModel.movie)
                            
                            if let data = UserDefaultFuncs.shared.saveMovies(movieList) {
                                movieDataList = data
                                buttonImage = updateButton(isContain: true)
                            }
                            
                        }
                        
                    } else {
                        var movieList: [MovieResult] = []
                        movieList.append(viewModel.movie)
                        
                        if let data = UserDefaultFuncs.shared.saveMovies(movieList) {
                            movieDataList = data
                            buttonImage = updateButton(isContain: true)
                        }
                        
                    }
                    
                } label: {
                    if let movieList = UserDefaultFuncs.shared.loadMovies(), movieList != [] {
                        if movieList.contains(viewModel.movie) {
                            Image(systemName: buttonImage)
                                .foregroundStyle(.white)
                        } else {
                            Image(systemName: buttonImage)
                                .foregroundStyle(.white)
                        }
                    } else {
                        Image(systemName: buttonImage)
                            .foregroundStyle(.white)
                    }
                    //
                }
                
                Button {
                    path = NavigationPath()
                } label: {
                    Image(systemName: "house")
                        .foregroundStyle(.white)
                }
            }
            
        })
        
    }
    
    func updateButton(isContain: Bool) -> String {
        var buttonImage = "plus"
        if isContain {
            buttonImage = "trash"
        }
        
        return buttonImage
    }
    
}
//#Preview {
//    DetailPage()
//}
