//
//  Disposable.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

public protocol Disposable {

  func dispose()
}

extension URLSessionDataTask: Disposable {

  public func dispose() {
    self.cancel()
  }
}
