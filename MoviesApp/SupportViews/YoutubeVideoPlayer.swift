//
//  YoutubeVideoPlayer.swift
//  MoviesApp
//
//  Created by Fatih Özen on 25.06.2024.
//

import SwiftUI
import YouTubeiOSPlayerHelper

struct YouTubePlayerView: UIViewRepresentable {
    var videoID: String
    
    func makeUIView(context: Context) -> YTPlayerView {
        return YTPlayerView()
    }
    
    func updateUIView(_ uiView: YTPlayerView, context: Context) {
        uiView.load(withVideoId: videoID)
    }
}
