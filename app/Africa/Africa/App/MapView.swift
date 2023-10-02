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
      //      MapAnnotation(coordinate: location.location) {
      //        Image("logo")
      //          .resizable()
      //          .scaledToFit()
      //          .frame(width: 32, height: 32, alignment: .center)
      //      }
      // (D) CUSTOM ADVANCED ANNOTATION
      MapAnnotation(coordinate: location.location) {
        MapAnnotationView(location: location)
      }
    }
    .overlay(
      HStack(alignment: .center, spacing: 12) {
        Image("compass")
          .resizable()
          .scaledToFit()
          .frame(width: 48, height: 48, alignment: .center)
        
        VStack(alignment: .leading, spacing: 3){
          HStack {
            Text("Latitude:")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.accentColor)
            Spacer()
            Text("\(region.center.latitude)")
              .font(.footnote)
              .foregroundColor(.white)
          }
          HStack {
            Text("Longitude:")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.accentColor)
            Spacer()
            Text("\(region.center.longitude)")
              .font(.footnote)
              .foregroundColor(.white)
          }
        }
      }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(
          Color.black
            .cornerRadius(8)
            .opacity(0.6)
        )
        .padding()
      , alignment: .top
    )
  }
  
  
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
