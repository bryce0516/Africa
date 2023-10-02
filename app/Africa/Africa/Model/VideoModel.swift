//
//  VideoModel.swift
//  Africa
//
//  Created by Hye Sung Park on 10/2/23.
//

import Foundation


struct Video : Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
}
