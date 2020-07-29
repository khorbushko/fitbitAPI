//
//  FitBitTokenPair.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

/*
     {
       "access_token": "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMkJWVEMiLCJzdWIiOiI4TUhIWTciLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJ3aHIgd3BybyB3bnV0IHdzbGUgd3dlaSB3c29jIHdhY3Qgd3NldCB3bG9jIiwiZXhwIjoxNTk2MDA3NzgzLCJpYXQiOjE1OTU5MjEzODN9.sIzvpHKY1LV4fcjYgqVd39g15aiIlf9YZ5NzMbAGtzI",
       "expires_in": 86400,
       "refresh_token": "be724fd1bb512bb6bd172a1a90e49d9859cdd006ad15a98a43eed9c98683d4ba",
       "scope": "heartrate sleep location weight activity profile nutrition social settings",
       "token_type": "Bearer",
       "user_id": "8MHHY7"
     }
 */
public final class FitBitTokenPair: Codable {

  public let accessToken: String
  public let refreshToken: String
  public let tokenType: String
  public let userId: String
  public let expiresIn: TimeInterval

  private let scope: String
  public var scopes: [String] {
    scope
      .split(separator: " ")
      .map(String.init)
  }

  class func decodeFrom(_ json: String) throws -> Self  {

    enum DecodeError: Swift.Error {

      case invalidInputJSON
    }

    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    if let data = json.data(using: .utf8) {
      let object = try decoder.decode(Self.self, from: data)
      return object
    }

    throw DecodeError.invalidInputJSON
  }

  // MARK: - LifeCycle

  private init(_ accessToken: String,
               refreshToken: String,
               expiresIn: TimeInterval,
               scope: String,
               userId: String,
               tokenType: String) {
    self.accessToken = accessToken
    self.refreshToken = refreshToken
    self.expiresIn = expiresIn
    self.scope = scope
    self.userId = userId
    self.tokenType = tokenType
  }
}

extension FitBitTokenPair: CustomStringConvertible {

  public var description: String {
    """
      FitBitTokenPair
        > accessToken: \(accessToken)
        > refreshToken: \(refreshToken)
        > scope: \(scopes)
        > userId: \(userId)
        > tokenType: \(tokenType)
        > expiresIn: \(expiresIn)
    """
  }
}

extension FitBitTokenPair: DataTansformable {

  // MARK: - DataTansformable

  public convenience init?(data: Data) {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    if let object = try? decoder.decode(FitBitTokenPair.self, from: data) {
      self.init(object.accessToken,
                refreshToken: object.refreshToken,
                expiresIn: object.expiresIn,
                scope: object.scope,
                userId: object.userId,
                tokenType: object.tokenType)
    } else {
      return nil
    }
  }

  public func dataRepresentation() -> Data? {
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    return try? encoder.encode(self)
  }
}
