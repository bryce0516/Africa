//
//  MapView.swift
//  Africa
//
//  Created by 박혜성(Hyesung Park) on 2023/09/04.
//

import SwiftUI
import MapKit

struct MapView: View {
  // MARK: - PROPERTIES
  
  @State private var region: MKCoordinateRegion = {
    var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    var mapZoomLevel =
    MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    
    var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    
    return mapRegion
  }()
  
  let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  
  // MARK: - BODY
  var body: some View {
    // MARK: -No1 BASIC MAP
    // Map(coordinateRegion: $region)
    Map(coordinateRegion: $region, annotationItems: locations) { location in
      // (A) PIN: OLD STYLE
      // MapPin(coordinate: location.location, tint: .accentColor)
      // (B) MARKER: NEW STYLE
      // MapMarker(coordinate: location.location, tint: .accentColor)
      // (C) Custom annocation
      MapAnnotation(coordinate: location.location) {
        Image("logo")
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32, alignment: .center)
      }
    }
  }
  
  
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
