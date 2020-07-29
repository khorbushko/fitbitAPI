//
//  AuthHandlerType.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation
import SafariServices
import AuthenticationServices
import UIKit

protocol AuthHandlerType: class {

  var session: NSObject? { get set }

  var contextProvider: NSObject? { get set }

  func performAuth(url: URL,
                   callbackScheme: String,
                   completion: @escaping FitBitAuth.CompletionHandler)
}

extension AuthHandlerType {

  func performAuth(url: URL,
                   callbackScheme: String,
                   completion: @escaping FitBitAuth.CompletionHandler) {

    if #available(iOS 12, *) {
      let session = ASWebAuthenticationSession(url: url, callbackURLScheme: callbackScheme) {
        url, error in

        if #available(iOS 13, *) {
          (self.contextProvider as? AuthContextProvider)?.clear()
        }
        completion(url, error)
      }

      self.session = session

      if #available(iOS 13, *) {
        self.contextProvider = ContextProvider()
        session.presentationContextProvider = self.contextProvider as? AuthContextProvider
      }

      session.start()

    } else {
      let session = SFAuthenticationSession(url: url, callbackURLScheme: callbackScheme) {
        url, error in
        completion(url, error)
      }

      self.session = session
      session.start()
    }

    assert(session != nil, "session shouldn't be nil")
  }
}
