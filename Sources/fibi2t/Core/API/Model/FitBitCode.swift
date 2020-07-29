//
//  FitBitToken.swift
//  fibi
//
//  Created by Kyryl Horbushko on 27.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

final public class FitBitCode {

  public let code: String
  public let type: FitBitAuthType

  init(code: String, type: FitBitAuthType) {
    self.code = code
    self.type = type
  }
}
