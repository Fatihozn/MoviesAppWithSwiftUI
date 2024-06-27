//
//  HorizontalTVListView.swift
//  MoviesApp
//
//  Created by Fatih Özen on 26.06.2024.
//

import SwiftUI
import Kingfisher

struct HorizontalTVListView: View {
    
    let rows = [GridItem(.adaptive(minimum: 150, maximum: .infinity))]
    let list: [TVResult]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(list) { tv in
                    
                    NavigationLink(value: tv) {
                        Group {
                            if tv._posterPath == "" {
                                Image(systemName: "film")
                            } else {
                                KFImage(URL(string: APIURLs.downloadImage(posterPath: tv._posterPath)))
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
