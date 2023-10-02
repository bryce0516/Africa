//
//  GalleryView.swift
//  Africa
//
//  Created by 박혜성(Hyesung Park) on 2023/09/04.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      } //: SCROLLVIEW
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(MotionAnimationView())

    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
