//
//  RootView.swift
//  MoviesApp
//
//  Created by Fatih Özen on 19.05.2024.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            MovieListsPage()
                .tabItem {
                    Label("Movies", systemImage: "movieclapper")
                }
            
            TvListPage()
                .tabItem {
                    Label("shows", systemImage: "tv")
                }
            
            SearchPage()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            WatchingList()
                .tabItem {
                    Label("Watching List", systemImage: "list.star")
                }
        }
    }
}

#Preview {
    RootView()
}
