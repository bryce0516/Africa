//
//  CoverImageView.swift
//  Africa
//
//  Created by 박혜성(Hyesung Park) on 2023/09/04.
//

import SwiftUI

struct CoverImageView: View {
  
  // MARK: - PROPERTIES
  
  let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
  
  // MARK: - BODY
  
  
  var body: some View {
    TabView {
      ForEach(coverImages) { item in
        Image(item.name)
          .resizable()
          .scaledToFill()
      }//: LOOP
    }//: TAP
    .tabViewStyle(PageTabViewStyle())
  }
}

struct CoverImageView_Previews: PreviewProvider {
  static var previews: some View {
    CoverImageView()
      .previewLayout(.fixed(width: 400, height: 300))
  }
}
