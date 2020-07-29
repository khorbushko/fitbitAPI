//
//  FitBitAccessDataStorage.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

internal enum FitBitAccessDataStorage {

  private enum Constants {

    static let service = "com.fibi.storage"

    enum Key {

      static let tokenPair = "fibi.tokenPair"
    }
  }

  @KeychainStored(Constants.Key.tokenPair, service: Constants.service)
  static var tokenPair: FitBitTokenPair?

  static func removeTokens() {
    FitBitAccessDataStorage.tokenPair = nil
  }
}
