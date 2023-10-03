//
//  CenterModifier.swift
//  Africa
//
//  Created by Hye Sung Park on 10/3/23.
//

import Foundation
import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
