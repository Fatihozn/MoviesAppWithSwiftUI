//
//  TvListView.swift
//  MoviesApp
//
//  Created by Fatih Özen on 19.05.2024.
//

import SwiftUI

struct TvListPage: View {
    
    @StateObject private var ViewModel = ListPageViewModel()
    
    var body: some View {
        
        ListsView(shows: ViewModel.tvLists, type: "tv")
            .onAppear {
                ViewModel.getTVLists()
            }
    }
}

