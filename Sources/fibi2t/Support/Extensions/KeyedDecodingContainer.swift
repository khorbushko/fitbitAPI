//
//  Keyed.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {

  func decode<T: Decodable>(_ key: Key, as type: T.Type = T.self) throws -> T {
    return try self.decode(T.self, forKey: key)
  }

  func decodeIfPresent<T: Decodable>(_ key: KeyedDecodingContainer.Key) throws -> T? {
    return try decodeIfPresent(T.self, forKey: key)
  }
}
