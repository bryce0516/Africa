//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Hye Sung Park on 10/2/23.
//

import SwiftUI

struct MapAnnotationView: View {
  // MARK: - PROPERTIES
  var location: NationalParkLocation
  @State private var animation: Double = 0.0
  // MARK: - BODY
  var body: some View {
    ZStack {
      Circle()
        .fill(Color.accentColor)
        .frame(width: 54, height: 54, alignment: .center)
      
      Circle()
        .stroke(Color.accentColor, lineWidth: 2)
        .frame(width: 52, height: 52, alignment: .center)
        .scaleEffect(1 + CGFloat(animation))
        .opacity(1 - animation)
      
      Image(location.image)
        .resizable()
        .scaledToFit()
        .frame(width: 48, height: 48, alignment: .center)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
    .onAppear {
      withAnimation(
        Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
          animation = 1
        }
    }
    
  }
}

struct MapAnnotationView_Previews: PreviewProvider {
  static var previews: some View {
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    return MapAnnotationView(location: locations[0])
  }
}
