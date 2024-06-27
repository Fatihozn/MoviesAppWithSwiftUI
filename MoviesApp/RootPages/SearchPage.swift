//
//  SearchPage.swift
//  MoviesApp
//
//  Created by Fatih Özen on 19.05.2024.
//

import SwiftUI
import Kingfisher

struct SearchPage: View {
    
    @StateObject private var viewModel = SearchViewModel()
    
    @State var path = NavigationPath()
    @State var text = ""
    
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
                        ForEach(viewModel.movieSearchedList) { movie in
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
                    
                    Text("Movies")
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
                        ForEach(viewModel.showSearchedList) { show in
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
                    
                    Text("Shows")
                        .font(.system(size: 28, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                }
                
            }
            .onChange(of: text) { oldValue, newValue in
                if newValue == "" {
                    viewModel.getTrendingList()
                } else {
                    viewModel.getSearchedList(text: newValue)
                }
            }
            .searchable(text: $text)
            .textInputAutocapitalization(.never)
            .navigationDestination(for: CastResult.self) { cast in
                CastDetailPage(path: $path, id: cast._id)
            }
            .navigationDestination(for: MovieResult.self) { movie in
                MovieDetailPage(path: $path, id: movie._id)
            }
            .navigationDestination(for: TVResult.self) { tv in
                TVDetailPage(path: $path, id: tv._id)
            }
        }
        .onAppear {
            viewModel.getTrendingList()
        }
        
        
        
    }
}
