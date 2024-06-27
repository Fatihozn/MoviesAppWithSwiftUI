//
//  HorizantalMovieListView.swift
//  MoviesApp
//
//  Created by Fatih Özen on 19.05.2024.
//

import SwiftUI
import Kingfisher

struct HorizontalMovieListView: View {
    
    let rows = [GridItem(.adaptive(minimum: 150, maximum: .infinity))]
    let list: [MovieResult]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(list) { movie in
                    
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
                        .frame(width: 140, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        
                    }
                    
                }
            }
            .frame(height: 180)
        }
    }
}

