//
//  MoviesListPage.swift
//  MoviesApp
//
//  Created by Fatih Özen on 19.05.2024.
//

import SwiftUI

struct MovieListsPage: View {
    
    @StateObject private var ViewModel = ListPageViewModel()
    
    var body: some View {
        
        ListsView(movies: ViewModel.movieLists, type: "movie")
            .onAppear {
                ViewModel.getMovieLists()
            }
    }
}
