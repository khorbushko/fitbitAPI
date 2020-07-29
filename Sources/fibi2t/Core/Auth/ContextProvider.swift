//
//  ContextProvider.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation
import AuthenticationServices
import UIKit

@available(iOS 13.0, *)
public protocol AuthContextProvider where Self: ASWebAuthenticationPresentationContextProviding {

  func clear()
}

@available(iOS 13.0, *)
extension ContextProvider: AuthContextProvider {

  public func clear() {
    context = nil
  }
}

@available(iOS 12.0, *)
final class ContextProvider: NSObject {

  private var context: ASPresentationAnchor?

  // MARK: - ASWebAuthenticationPresentationContextProviding

  public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
    let window = UIWindow()
    window.makeKeyAndVisible()
    self.context = window
    return window
  }
}
