//
//  ContentView.swift
//  Africa
//
//  Created by 박혜성(Hyesung Park) on 2023/09/04.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    // MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    // MARK: - BODY
    NavigationView {
      List {
        CoverImageView()
          .frame(height: 300)
          .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        
        ForEach(animals) { animal in
          NavigationLink(destination: AnimalDetailView(animal: animal)) {
            AnimalListItemView(animal: animal)
          }
//          
        }
      }
      .navigationTitle("Africa")
      .navigationBarTitleDisplayMode(.large)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
