//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Aakash Gupta on 06/04/25.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - PROPERTIES
    let video: Video
    
    // MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(
                player: playVideo(
                    fileName: video.id,
                    fileFormat: "mp4"
                )
            ) {
//                Text(video.name)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                , alignment: .topLeading
            )
        }//: VStack
        .accentColor(.accentColor)
        .navigationBarTitle(video.name, displayMode: .inline)
    }
}

// MARK: - PREVIEW
#Preview {
    let videos: [Video] = Bundle.main.decode("videos.json")
    NavigationView {
        VideoPlayerView(
            video: videos[1]
        )
    }
}
