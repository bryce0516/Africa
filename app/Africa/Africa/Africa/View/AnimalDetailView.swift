//
//  AnimalDetailView.swift
//  Africa
//
//  Created by 박혜성(Hyesung Park) on 2023/09/04.
//

import SwiftUI

struct AnimalDetailView: View {
  // MARK: - PROPERTY
  
  let animal : Animal
  
  // MARK: - BODY
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        // HERO IMAGE
        Image(animal.image)
          .resizable()
          .scaledToFit()
        // TITLE
        Text(animal.name.uppercased())
          .font(.largeTitle)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .padding(.vertical, 8)
          .foregroundColor(.primary)
          .background(
            Color.accentColor
              .frame(height: 6)
              .offset(y: 24)
          )
        
        // HEADLINE
        Text(animal.headline)
          .font(.headline)
          .multilineTextAlignment(.leading)
          .foregroundColor(.accentColor)
          .padding(.horizontal)
        
        // GALLERY
        Group {
          HeadingView(
            headingImage: "photo.on.rectangle.angled",
            headingText: "Wilderness in Pictures"
          )
          
          InsetGalleryView(animal: animal)
        }
        .padding(.horizontal)
        
        // FACTS
        
        // DESCRIPTION
        
        // MAP
        
        // LINK
        
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      }
      .navigationTitle("Learn about \(animal.name)")
      .navigationBarTitleDisplayMode(.inline)
      
    }
    
  }
}

struct AnimalDetailView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    NavigationView {
      AnimalDetailView(animal: animals[0])
    }
    .previewDevice("iPhone 12 Pro")
    
  }
}
