//
//  VideoListItem.swift
//  Africa
//
//  Created by Aakash Gupta on 06/04/25.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: - PROPERTIES
    let video: Video
    
    // MARK: - BODY
    var body: some View {
        HStack {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }//: ZStack
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }//: HStack
    }
}

// MARK: - PREVIEW
#Preview {
    let videos: [Video] = Bundle.main.decode("videos.json")
    VideoListItemView(
        video: videos[0]
    )
        .previewLayout(.sizeThatFits)
        .padding()
}
