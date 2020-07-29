//
//  KeyStorage.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

final class KeyStorage {

  // MARK: - Public

  class func storeDataForKey(_ key: String, for value: Data, service: String) {
    let keychain = Keychain(service: service)
    keychain[data: key] = value
  }

  class func obtainDataValue(for key: String, service: String) -> Data? {
    let keychain = Keychain(service: service)
    let value = keychain[data: key]
    return value
  }

  class func availableKeys(_ service: String) -> [String] {
    let keychain = Keychain(service: service)
    let keys = keychain.allKeys()
    return keys
  }

  class func removeValue(for key: String, service: String) throws {
    let keychain = Keychain(service: service)
    return try keychain.remove(key)
  }

  class func removeAllKeys(for service: String) {
    KeyStorage.availableKeys(service).forEach { (key) in
      try? KeyStorage.removeValue(for: key, service: service)
    }
  }
}
