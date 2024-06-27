//
//  MovieListsView.swift
//  MoviesApp
//
//  Created by Fatih Özen on 25.06.2024.
//

import SwiftUI

struct MoviesListView: View {
    
    let movies: [String: [MovieResult]]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible(minimum: 50, maximum: .infinity))]) {
            ForEach(movies.keys.sorted(), id: \.self) { key in
                Section {
                   
                    HorizontalMovieListView(list: movies[key]!)
                    
                } header: {
                    Text(key)
                        .font(.system(size: 24, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            
        }
    }
}



