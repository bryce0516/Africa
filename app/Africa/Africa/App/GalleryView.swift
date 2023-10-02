//
//  GalleryView.swift
//  Africa
//
//  Created by 박혜성(Hyesung Park) on 2023/09/04.
//

import SwiftUI

struct GalleryView: View {
  let animals: [Animal] = Bundle.main.decode("animals.json")
//  let gridLayout: [GridItem] = [
//    GridItem(.flexible()),
//    GridItem(.flexible()),
//    GridItem(.flexible())
//  ]
  let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      // MARK: - GRID
      LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
        ForEach(animals) { item in
          Image(item.image)
            .resizable()
            .scaledToFit()
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(
              Circle()
                .stroke(Color.white, lineWidth: 1)
            )
        } //: LOOP
      } //: GRID
      
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
