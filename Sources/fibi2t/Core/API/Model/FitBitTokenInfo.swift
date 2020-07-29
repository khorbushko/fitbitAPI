//
//  FitBitTokenInfo.swift
//  fibi
//
//  Created by Kyryl Horbushko on 29.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

/*
   {
     "active":true,
     "scope":"{ACTIVITY=READ_WRITE}",
     "client_id":"<Client Id>",
     "user_id":"<User Id>",
     "token_type":"access_token",
     "exp":<expiration date>,
     "iat":<issued date>
   }
 */
final public class FitBitTokenInfo: Codable {

  public let active: Bool
  public let scope: String?
  public let clientId: String?
  public let userId: String?
  public let tokenType: String?
  public let exp: Date?
  public let iat: Date?
}
