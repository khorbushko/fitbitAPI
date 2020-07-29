//
//  FitBitConfig.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

public struct FitBitConfig {

  public let authType: FitBitAuthType

  // 22BVTC
  // https://dev.fitbit.com/apps
  public let clientId: String

  // edfaf1850c66b3747129624b4b99dc75
  // https://dev.fitbit.com/apps
  public let clientSecret: String

  // myapp://
  // https://dev.fitbit.com/apps
  public let redirectScheme: String

  // myapp://fitbit/auth
  public var redirectURL: String {
    "\(redirectScheme)fitbit/auth"
  }

  public let scope: [String]
  public let expireTime: TimeInterval
  public let prompt: String

  public enum ExpirationTimeInterval {

    public static let minute: TimeInterval = 60
    public static let hour: TimeInterval = minute * 60
    public static let day: TimeInterval = hour * 24
  }

  // MARK: - Public constructors

  public static func authGrantFlowConfig(clientId: String,
                                         clientSecret: String,
                                         redirectScheme: String,
                                         prompt: String,
                                         expireTime: TimeInterval = ExpirationTimeInterval.hour,
                                         scope: [String] = FitBitScopes.all) -> FitBitConfig {

    assert(redirectScheme.hasSuffix("://"), "invalid redirect scheme")

    let config = FitBitConfig(authType: FitBitAuthType.code,
                              clientId: clientId,
                              clientSecret: clientSecret,
                              redirectScheme: redirectScheme,
                              scope: scope,
                              expireTime: expireTime,
                              prompt: prompt)
    return config
  }

  public static func implicitGrantFlowConfig(clientId: String,
                                             clientSecret: String,
                                             redirectScheme: String,
                                             prompt: String,
                                             expireTime: TimeInterval = ExpirationTimeInterval.hour,
                                             scope: [String] = FitBitScopes.all) -> FitBitConfig {

    assert(redirectScheme.hasSuffix("://"), "invalid redirect scheme")

    let config = FitBitConfig(authType: FitBitAuthType.token,
                              clientId: clientId,
                              clientSecret: clientSecret,
                              redirectScheme: redirectScheme,
                              scope: scope,
                              expireTime: expireTime,
                              prompt: prompt)
    return config
  }

  // MARK: - Internal

  internal func toQueryItems() -> [URLQueryItem] {
    [
      URLQueryItem(name: "response_type", value: authType.rawValue),
      URLQueryItem(name: "client_id", value: clientId),
      URLQueryItem(name: "redirect_url", value: redirectURL),
      URLQueryItem(name: "scope", value: scope.joined(separator: " ")),
      URLQueryItem(name: "expires_in", value: String(expireTime)),
      URLQueryItem(name: "prompt", value: prompt)
    ]
  }
}
