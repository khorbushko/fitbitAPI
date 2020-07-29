//
//  FitBitError.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

/*
   {
     "success": false,
     "errors": [
       {
         "errorType": "invalid_token",
         "message": "Access token invalid: eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMkJWVEMiLCJzdWIiOiI4TUhIWTciLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJ3aHIgd251dCB3cHJvIHdzbGUgd3dlaSB3c29jIHdzZXQgd2FjdCB3bG9jIiwiZXhwIjoxNTk1OTUzODU0LCJpYXQiOjE1OTU4Njc0NTR9.3kuTPhVEWaZPdJ7KLvPiIAzQhnqzuX1tP9FLYPjt-8M. Visit https://dev.fitbit.com/docs/oauth2 for more information on the Fitbit Web API authorization process."
       },
       {
        "errorType": "not_found",
        "fieldName": "n/a",
        "message": "The API you are requesting could not be found."
       }
     ]
   }
 */
final public class FitBitError: Codable, Error {

  public let success: Bool
  public private (set) var errors: [FitBitAtomicError]

  private init() {
    success = false
    errors = []
  }
}

final public class FitBitAtomicError: Codable, Error {

  public let errorType: String
  public let message: String
  public let fieldName: String?

  fileprivate init(errorType: String, message: String) {
    self.errorType = errorType
    self.message = message
    self.fieldName = nil
  }
}

public enum FitBitDecodingIssue: CustomStringConvertible {

  case dataNull
  case unknownResponse
  case decodingError
  case reAuthRequired
  case custom(Swift.Error)

  public var description: String {
    switch self {
      case .dataNull:
        return "Data is null"
      case .unknownResponse:
        return "Unknown response"
      case .decodingError:
        return "Decoding error"
      case .reAuthRequired:
        return "Fatal - can't perform refresh token operation, please reauth"
      case .custom(let error):
        return error.localizedDescription
    }
  }
}

public protocol FitBitErrorConstructable where Self: Swift.Error {

  static func prepareFor(_ issue: FitBitDecodingIssue) -> Swift.Error
}

extension FitBitError: FitBitErrorConstructable {

  // MARK: - FitBitErrorConstructable

  public static func prepareFor(_ issue: FitBitDecodingIssue) -> Swift.Error {
    let error = FitBitError()
    error.errors = [
      FitBitAtomicError(errorType: issue.description,
                        message: "internal error - please check parse logic for more or/and enable logs")
    ]
    return error
  }
}
