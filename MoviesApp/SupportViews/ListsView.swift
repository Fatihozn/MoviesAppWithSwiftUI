//
//  ContentView.swift
//  MoviesApp
//
//  Created by Fatih Özen on 12.05.2024.
//

import SwiftUI

struct ListsView: View {
    
    @State var path = NavigationPath()
    var movies: [String: [MovieResult]] = ["": []]
    var shows: [String: [TVResult]] = ["": []]
    let type: String
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                GeometryReader { proxy in
                    
                    let width = proxy.size.width
                    
                    ScrollView(showsIndicators: false) {
                      
                       // HeroImageView(width: width)
                        
                        switch type {
                        case "tv":
                            TVListView(shows: shows)
                        default:
                            MoviesListView(movies: movies)
                        }
                       
                        
                    }
                    
                }
                .padding(10)
            }
            .navigationTitle("HOME")
            .navigationBarTitleDisplayMode(.inline)
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

//struct HeroImageView: View {
//    
//    let width: CGFloat
//    
//    var body: some View {
//        
//        VStack {
//            TabView {
//                ForEach(0..<4) { num in
//                    NavigationLink(value: num) {
//                        Image(systemName: "rectangle.portrait.and.arrow.forward.fill")
//                            .frame(width: width, height: 250)
//                            .background(.yellow)
//                    }
//                }
//            }
//            .tabViewStyle(PageTabViewStyle())
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//            .background(.black.opacity(0.6))
//            .ignoresSafeArea()
//            .frame(width: width, height: 250)
//            
//            
//        }
//    }
//}




