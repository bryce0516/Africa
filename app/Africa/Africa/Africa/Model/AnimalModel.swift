//
//  AnimalModel.swift
//  Africa
//
//  Created by 박혜성(Hyesung Park) on 2023/09/04.
//

import SwiftUI

struct Animal: Codable, Identifiable {
  let id : String
  let name: String
  let headline: String
  let description: String
  let link : String
  let image: String
  let gallery: [String]
  let fact: [String]
}
