//
//  String+Disctionary.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

extension String {

  func convertToDictionary() -> [String: Any]? {
    let string = self.replacingOccurrences(of: "'", with: "\"")
    if let data = string.data(using: .utf8) {
      do {
        return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
      } catch {
        return nil
      }
    }
    return nil
  }
}

extension Data {

  func convertToDictionary() -> [String: Any]? {
    do {
      return try JSONSerialization.jsonObject(with: self, options: .allowFragments) as? [String: Any]
    } catch {
      return nil
    }
  }
}
