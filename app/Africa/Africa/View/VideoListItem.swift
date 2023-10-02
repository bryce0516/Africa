//
//  VideoListItem.swift
//  Africa
//
//  Created by Hye Sung Park on 10/2/23.
//

import SwiftUI

struct VideoListItem: View {
  
  let video: Video
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

#Preview {
  let videos: [Video] = Bundle.main.decode("video.json")
  
  VideoListItem(video: videos[0])
//    .previewLayout(.sizeThatFits)
}
