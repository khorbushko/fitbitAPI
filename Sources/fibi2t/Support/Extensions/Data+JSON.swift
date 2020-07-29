//
//  Data+JSON.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

extension Data {

  // MARK: - JSON

  static func jsonDataFromObj(_ inputObj: AnyObject) -> Data? {
    let obj = try? JSONSerialization.data(withJSONObject: inputObj, options: .prettyPrinted)
    return obj
  }
}
