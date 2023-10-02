//
//  VideoListView.swift
//  Africa
//
//  Created by 박혜성(Hyesung Park) on 2023/09/04.
//

import SwiftUI

struct VideoListView: View {
  // MARK: - PROPERTIES
  
  var videos: [Video] = Bundle.main.decode("videos.json")
  
  // MARK: - BODY
    var body: some View {
      NavigationView {
        List {
          ForEach(videos) { video in
            VideoListItem(video: video)
          } //: FOREACH
        } //: LIST
      }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
