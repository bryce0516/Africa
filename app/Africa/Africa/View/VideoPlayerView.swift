//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Hye Sung Park on 10/2/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
  // MARK: - PROPERTIES
  var videoSelected: String
  var videoTitle: String
  
  // MARK: - BODY
  var body: some View {
    VStack {
      VideoPlayer(
        player:
          playVideo(fileName: videoSelected, fileFormat: "mp4")
          ) {
//            Text(videoTitle)
          }
          .overlay (
            Image("logo")
              .resizable()
              .scaledToFit()
              .frame(width: 32, height:32)
              .padding(.horizontal, 8)
            , alignment: .topLeading
          )
    } //: VSTACK
    .accentColor(.accentColor)
    .navigationTitle(videoTitle)
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  NavigationView {
    VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
  }
}
