//
//  ContentView.swift
//  Africa
//
//  Created by 박혜성(Hyesung Park) on 2023/09/04.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  @State private var isGridViewActive: Bool = false
  @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
  @State private var gridColumn: Int = 1
  @State private var toolbarICon: String = "square.grid.2x2"
  
  //  let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
  
  // MARK: - FUNCTIONS
  
  func gridSwitch() {
    gridLayout = Array(
      repeating: .init(.flexible()), count: gridLayout.count % 3 + 1
    )
    gridColumn = gridLayout.count
    
  }
  
  var body: some View {
    // MARK: - BODY
    NavigationView {
      Group {
        if !isGridViewActive {
          List {
            CoverImageView()
              .frame(height: 300)
              .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            ForEach(animals) { animal in
              NavigationLink(destination: AnimalDetailView(animal: animal)) {
                AnimalListItemView(animal: animal)
              }
            }
          } //: LIST
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal), label: {
                  AnimalGridItemView(animal: animal)
                })
              }
            }
            .padding(10)
            .animation(.easeIn)
          }
          
        } //: CONDITION
      } //: GROUP
      
      .navigationTitle("Africa")
      .navigationBarTitleDisplayMode(.large)
      .toolbar(content: {
        ToolbarItem(placement: .topBarTrailing) {
          HStack(spacing: 16) {
            Button(action: {
              isGridViewActive = false
              haptics.impactOccurred()
            }, label: {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(
                  isGridViewActive ? .primary : .accentColor)
            })
            
            Button(action: {
              isGridViewActive = true
              haptics.impactOccurred()
              gridSwitch()
            }, label: {
              Image(systemName: "square.grid.2x2")
                .font(.title2)
                .foregroundColor(
                  isGridViewActive ? .accentColor : .primary
                )
            })
          }
        }
      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
