//
//  TVListView.swift
//  MoviesApp
//
//  Created by Fatih Özen on 26.06.2024.
//

import SwiftUI

struct TVListView: View {
    
    let shows: [String: [TVResult]]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible(minimum: 50, maximum: .infinity))]) {
            ForEach(shows.keys.sorted(), id: \.self) { key in
                Section {
                   
                    HorizontalTVListView(list: shows[key]!)
                    
                } header: {
                    Text(key)
                        .font(.system(size: 24, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            
        }
    }
}
