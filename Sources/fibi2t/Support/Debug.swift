//
//  Debug.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

enum Debug {

  static func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    if FitBitSettings.enableDebugOutput {

      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
      let string = dateFormatter.string(from: Date())

      Swift.print("fibi: \(string) :",
        items,
        separator: separator,
        terminator: terminator)
    }
  }
}
