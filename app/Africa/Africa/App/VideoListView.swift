//
//  VideoListView.swift
//  Africa
//
//  Created by 박혜성(Hyesung Park) on 2023/09/04.
//

import SwiftUI

struct VideoListView: View {
  // MARK: - PROPERTIES
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
  // MARK: - BODY
  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { video in
          VideoListItemView(video: video)
            .padding(.vertical, 8)
        } //: LOOP
      } //: LIST
      .listStyle(InsetGroupedListStyle())
      .navigationTitle("Videos")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            videos.shuffle()
            hapticImpact.impactOccurred(intensity: <#T##CGFloat#>)
          } label: {
            Image(systemName: "arrow.2.squarepath")
          }
        }
      }
    }
  }
}

struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
    VideoListView()
  }
}
