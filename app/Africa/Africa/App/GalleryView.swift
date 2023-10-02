//
//  GalleryView.swift
//  Africa
//
//  Created by 박혜성(Hyesung Park) on 2023/09/04.
//

import SwiftUI

struct GalleryView: View {
  
  @State private var selectedAnimal: String = "lion"
  
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
//  let gridLayout: [GridItem] = [
//    GridItem(.flexible()),
//    GridItem(.flexible()),
//    GridItem(.flexible())
//  ]
//  let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0
  
  func gridSwitch() {
    gridLayout = Array(
      repeating: .init(.flexible()),
      count: Int(gridColumn)
    )
  }
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      // MARK: - GRID
      VStack(alignment: .center, spacing: 30) {
        
        Image(selectedAnimal)
          .resizable()
          .scaledToFit()
          .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
          .overlay(Circle().stroke(Color.white, lineWidth: 8))
        
        Slider(value: $gridColumn, in: 2...4, step: 1)
          .padding(.horizontal)
          .onChange(of: gridColumn, perform: {
            value in 
            withAnimation(.easeIn) {
              gridSwitch()
            }
          })
        
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
              .onTapGesture {
                selectedAnimal = item.image
                haptics.impactOccurred()
              }
          } //: LOOP
        } //: GRID
        .onAppear(perform: {
          gridSwitch()
        })
      }
      .padding(.horizontal, 10)
      .padding(.vertical, 50)
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
