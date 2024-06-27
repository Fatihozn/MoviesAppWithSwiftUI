//
//  castDetailPage.swift
//  MoviesApp
//
//  Created by Fatih Özen on 25.06.2024.
//

import SwiftUI
import Kingfisher

struct CastDetailPage: View {
    
    @Binding var path: NavigationPath
    
    let id: Int
    let rows = [GridItem(.adaptive(minimum: 150, maximum: .infinity))]
    
    @StateObject private var viewModel = CastDetailViewModel()
    
    @State private var overViewLine = 2
    @State private var overViewText = "more.."
    @State private var genresText = ""
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 15) {
                HStack(alignment: .top) {
                    Group {
                        if viewModel.cast._profilePath == "" {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 160, height: 180)
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .foregroundStyle(.gray)
                        } else {
                            KFImage(URL(string: APIURLs.downloadImage(posterPath: viewModel.cast._profilePath)))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 160, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                        
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.cast._name)
                            .font(.system(size: 22, weight: .bold))
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                        
                        Text(viewModel.cast._gender.findGender())
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.secondary)
                        
                        HStack {
                            Image(systemName: "birthday.cake")
                            Text(viewModel.cast._birthday)
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.secondary)
                        }
                        .padding(3)
                        
                        HStack {
                            Image(systemName: "house")
                            Text(viewModel.cast._placeOfBirth)
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.secondary)
                        }
                        .padding(3)
                        
                        if viewModel.cast._alsoKnownAs != [] {
                            HStack {
                                Image(systemName: "person.2.fill")
                                Text(viewModel.cast._alsoKnownAs.prefix(4).joined(separator: ", "))
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundStyle(.secondary)
                                
                            }
                            .padding(.horizontal, 3)
                        }
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if viewModel.cast._biography != "" {
                    VStack {
                        Text(viewModel.cast._biography)
                            .lineLimit(overViewLine == 2 ? 2 : nil)
                            .multilineTextAlignment(.leading)
                        
                        
                        Button {
                            overViewLine = (overViewLine == 0 ? 2 : 0)
                            overViewText = (overViewLine == 0 ? "less.." : "more..")
                        } label: {
                            Text(overViewText)
                                .foregroundColor(.cyan)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                }
                
                if viewModel.movieCredits != [] {
                    Section {
                        HorizontalMovieListView(list: viewModel.movieCredits)
                    } header: {
                        Text("Movies")
                            .font(.system(size: 24, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                if viewModel.tvCredits != [] {
                    Section {
                        HorizontalTVListView(list: viewModel.tvCredits)
                    } header: {
                        Text("shows")
                            .font(.system(size: 24, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                
            }
            .padding(10)
            
            
        }
        .onAppear {
            
            viewModel.getDetailCast(id: id)
            
        }
        .navigationTitle("Cast Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    path = NavigationPath()
                } label: {
                    Image(systemName: "house")
                        .foregroundStyle(.white)
                }
            }
        })
        
    }
}
