//
//  InsetMapView.swift
//  Africa
//
//  Created by 박혜성(Hyesung Park) on 2023/09/11.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
  
  @State privat var region = MKCoordinateRegion
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
