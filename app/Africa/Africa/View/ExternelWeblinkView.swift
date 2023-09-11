//
//  ExternelWeblinkView.swift
//  Africa
//
//  Created by 박혜성(Hyesung Park) on 2023/09/11.
//

import SwiftUI

struct ExternelWeblinkView: View {
  let animal: Animal
  
  var body: some View {
    GroupBox {
      HStack {
        Image(systemName: "globe")
        Text("Wikipedia")
        Spacer()
        
        Group {
          Image(systemName: "arrow.up.right.square")
          
          Link(
            animal.name,
            destination:
              URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
          
        }.foregroundColor(.accentColor)
      }
    }
  }
}

struct ExternelWeblinkView_Previews: PreviewProvider {
  
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  static var previews: some View {
    ExternelWeblinkView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
