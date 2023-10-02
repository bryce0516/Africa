//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by 박혜성(Hyesung Park) on 2023/09/04.
//
import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in bundle.")
    }
    
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) in bundle.")
    }
    
    let decoder = JSONDecoder()
    
    guard let loadedJson = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to decode \(file) from bundle.")
    }
    
    return loadedJson
  }
}
