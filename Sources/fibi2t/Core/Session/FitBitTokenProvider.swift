//
//  FitBitTokenProvider.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

public protocol FitBitTokenProvidable: class {

  var accessToken: String? { get }
  var refreshToken: String? { get }

  var tokenPair: FitBitTokenPair? { get set }

  func accessHTTPHeaders() -> [String: String]?
  func removeTokens()

  init()
}

open class FitBitTokenProvider: FitBitTokenProvidable {

  open var accessToken: String? {
    tokenPair?.accessToken
  }

  open var refreshToken: String? {
    tokenPair?.refreshToken
  }

  open var tokenPair: FitBitTokenPair? {
    get { FitBitAccessDataStorage.tokenPair }
    set { FitBitAccessDataStorage.tokenPair = newValue }
  }

  required public init() { }

  public func accessHTTPHeaders() -> [String: String]? {
    if let accessToken = accessToken {
      return [
        "Authorization": "Bearer \(accessToken)"
      ]
    }

    return nil
  }

  public func removeTokens() {
    FitBitAccessDataStorage.removeTokens()
  }
}
