//
//  HorizontalCastListView.swift
//  MoviesApp
//
//  Created by Fatih Özen on 25.06.2024.
//

import SwiftUI
import Kingfisher

struct HorizontalCastListView: View {
    
    let rows = [GridItem(.adaptive(minimum: 150, maximum: .infinity))]
    let list: [CastResult]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(list) { cast in
                    
                    NavigationLink(value: cast) {
                        VStack {
                            Group {
                                if cast._profilePath == "" {
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .foregroundStyle(.gray)
                                } else {
                                    KFImage(URL(string: APIURLs.downloadImage(posterPath: cast._profilePath)))
                                        .resizable()
                                }
                                
                            }
                            .scaledToFill()
                            .frame(width: 120, height: 140)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                            Text(cast._name)
                                .frame(maxWidth: 120)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                        }
                        .padding(.horizontal, 3)
                        
                        
                    }
                    
                }
            }
            .frame(height: 180)
        }
    }
}
