//
//  KeychainStored.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

import Foundation

public protocol DataTansformable {

  func dataRepresentation() -> Data?

  init?(data: Data)
}

@propertyWrapper
struct KeychainStored<T: DataTansformable> {

  private let key: String
  private let service: String

  // MARK: - LifeCycle

  public init(_ key: String, service: String) {
    self.key = key
    self.service = service
  }

  public var wrappedValue: T? {
    get {
      if let data = KeyStorage.obtainDataValue(for: key, service: service),
        let value = T(data: data) {
        return value
      }

      return nil
    }
    set {
      if let value = newValue,
        let data = value.dataRepresentation() {
        KeyStorage.storeDataForKey(key, for: data, service: service)
      } else {
        try? KeyStorage.removeValue(for: key, service: service)
      }
    }
  }
}
