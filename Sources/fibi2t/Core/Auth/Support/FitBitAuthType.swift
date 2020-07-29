//
//  FitBitAuthType.swift
//  fibi
//
//  Created by Kyryl Horbushko on 27.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

/// https://dev.fitbit.com/build/reference/web-api/oauth2/#authorization-page
public enum FitBitAuthType: String {

  /// Authorization Code Grant Flow
  case code = "code"

  /// Implicit Grant Flow
  case token = "token"
}
