//
//  TVDetailPage.swift
//  MoviesApp
//
//  Created by Fatih Özen on 26.06.2024.
//

import SwiftUI
import Kingfisher

struct TVDetailPage: View {
    
    @Binding var path: NavigationPath
    
    let id: Int
    let rows = [GridItem(.adaptive(minimum: 150, maximum: .infinity))]
    
    @StateObject private var viewModel = TVDetailViewModel()
    
    @AppStorage("showDataList")  private var showDataList: Data = Data()
    
    @State private var overViewLine = 2
    @State private var overViewText = "more.."
    @State private var genresText = ""
    @State private var buttonImage = "plus"
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 15) {
                HStack(alignment: .top) {
                    Group {
                        if viewModel.show._posterPath == "" {
                            Image(systemName: "film")
                                .resizable()
                                .frame(width: 160, height: 180)
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                
                        } else {
                            KFImage(URL(string: APIURLs.downloadImage(posterPath: viewModel.show._posterPath)))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 160, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.show._name)
                            .font(.system(size: 22, weight: .bold))
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                        
                        HStack {
                            Image(systemName: "calendar")
                            Text(viewModel.show._firstAirDate)
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.secondary)
                        }
                        .padding(3)
                        
                        if viewModel.show._genres.map({ $0._name }) != [] {
                            HStack {
                                Image(systemName: "film")
                                Text(viewModel.show._genres.map { $0._name }.joined(separator: ", "))
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundStyle(.secondary)
                                
                            }
                            .padding(.horizontal, 3)
                        }
                        
                        if viewModel.show._voteAverage > 1 {
                            HStack {
                                Image(systemName: "star.fill")
                                Text(String(viewModel.show._voteAverage))
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundStyle(.secondary)
                            }
                            .padding(3)
                        }
                        
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(alignment: .center){
                    Text("Seasons: \(viewModel.show._Seasons)")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.horizontal, 3)
                    Text("Episodes: \(viewModel.show._episodes)")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.horizontal, 3)
                }
                
                if viewModel.show._overview != "" {
                    
                    VStack {
                        Text(viewModel.show._overview)
                            .lineLimit(overViewLine == 2 ? 2 : nil)
                            .multilineTextAlignment(.leading)
                        
                        
                        Button {
                            withAnimation {
                                overViewLine = (overViewLine == 0 ? 2 : 0)
                                overViewText = (overViewLine == 0 ? "less.." : "more..")
                            }
                        } label: {
                            Text(overViewText)
                                .foregroundColor(.cyan)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                    }
                    .padding(3)
                    
                }
                
                if viewModel.video._key != "" {
                    YouTubePlayerView(videoID: viewModel.video._key)
                        .frame(height: 250)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
                
                VStack {
                    if viewModel.castList != [] {
                        Section {
                            HorizontalCastListView(list: viewModel.castList)
                        } header: {
                            Text("Cast")
                                .font(.system(size: 24, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                    if viewModel.similarshows != [] {
                        Section {
                            HorizontalTVListView(list: viewModel.similarshows)
                        } header: {
                            Text("Similar shows")
                                .font(.system(size: 24, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    
                    
                }
                
            }
            .padding(10)
            
            
        }
        .onAppear {
            
            viewModel.getDetailTV(id: id) { isContain in
                buttonImage = updateButton(isContain: isContain)
            }
            
        }
        .navigationTitle("Show Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    
                    if var showList = UserDefaultFuncs.shared.loadShows(), showList != [] {
                        if let index = showList.firstIndex(of: viewModel.show) {
                            showList.remove(at: index)
                            if let data = UserDefaultFuncs.shared.saveShows(showList) {
                                showDataList = data
                                buttonImage = updateButton(isContain: false)
                            }
                            
                        } else {
                            showList.append(viewModel.show)
                            
                            if let data = UserDefaultFuncs.shared.saveShows(showList) {
                                showDataList = data
                                buttonImage = updateButton(isContain: true)
                            }
                            
                        }
                        
                    } else {
                        var showList: [TVResult] = []
                        showList.append(viewModel.show)
                        
                        if let data = UserDefaultFuncs.shared.saveShows(showList) {
                            showDataList = data
                            buttonImage = updateButton(isContain: true)
                        }
                        
                    }
                    
                } label: {
                    if let showList = UserDefaultFuncs.shared.loadShows(), showList != [] {
                        if showList.contains(viewModel.show) {
                            Image(systemName: buttonImage)
                                .foregroundStyle(.white)
                        } else {
                            Image(systemName: buttonImage)
                                .foregroundStyle(.white)
                        }
                    } else {
                        Image(systemName: buttonImage)
                            .foregroundStyle(.white)
                    }
                    //
                }
                
                Button {
                    path = NavigationPath()
                } label: {
                    Image(systemName: "house")
                        .foregroundStyle(.white)
                }
            }
            
        })
    }
    
    func updateButton(isContain: Bool) -> String {
        var buttonImage = "plus"
        if isContain {
            buttonImage = "trash"
        }
        
        return buttonImage
    }
    
}

//#Preview {
//    DetailPage()
//}
