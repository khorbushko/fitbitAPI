//
//  FitBitSession.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

public extension FitBitAPI {

  typealias CompletionHandler<T: Codable, E: Swift.Error> = (Result<T, E>) -> Void
  typealias FitBitRequestResult<TIn, TOut: Decodable> = (TIn) -> TOut?
  typealias ResourceValuePair = (String, String)
}

final public class FitBitAPI {

  private var fitBitAuth: FitBitAuth
  private var session: URLSession
  private var executionQueue: DispatchQueue = DispatchQueue(label: "fibi.api.serial.execution")
  private var semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)

  public var isTokenAvailable: Bool {
    fitBitAuth.tokenProvider.accessToken != nil &&
    fitBitAuth.tokenProvider.refreshToken != nil
  }

  // MARK: - LifeCycle

  public init(_ config: FitBitConfig, tokenProvider: FitBitTokenProvidable? = nil) {
    let tokenProvider = tokenProvider ?? FitBitTokenProvider()
    self.fitBitAuth = FitBitAuth(config: config, tokenProvider: tokenProvider)

    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = [
      HTTPHeader.Key.acceptLanguage: "en",
      "Accept-Locale": "en_US"
    ]
    self.session = URLSession(configuration: configuration)
  }

  // MARK: - Auth

  public func auth(_ completion: @escaping FitBitAuth.FitBitResponse<FitBitCode>) {
    fitBitAuth.auth(completion)
  }

  public func exchangeCodeForToken(code: FitBitCode,
                                   completion: @escaping FitBitAuth.FitBitResponse<FitBitTokenPair>) {
    fitBitAuth.exchangeCodeForToken(code: code, completion: completion)
  }

  public func refreshToken(_ currentPair: FitBitTokenPair,
                           completion: @escaping FitBitAuth.FitBitResponse<FitBitTokenPair>) {
    fitBitAuth.refreshToken(currentPair, completion: completion)
  }

  public func revokeAllTokenAndSessions(_ currentPair: FitBitTokenPair,
                                 completion: @escaping FitBitAuth.FitBitResponse<FitBitSuccess>) {
    fitBitAuth.revokeAllTokenAndSessions(currentPair, completion: completion)
  }

  func clearToken() {
    fitBitAuth.clearStoredToken()
  }

  // MARK: - Public

  @discardableResult
  internal func execute<T: Codable, E: Swift.Error & Decodable & FitBitErrorConstructable>(_ request: FitBitRequest<T, E>, completion: @escaping FitBitAPI.CompletionHandler<T, E>) -> Disposable {

    var executableRequest = request.urlRequest()
    executableRequest.allHTTPHeaderFields = configureHeadersFor(executableRequest)
    let task = session.dataTask(with: executableRequest) { (data, response, error) in

      self.printDebugOutput(request, response: response, responseData: data, error: error)

      let signalDone = {
        _ = self.semaphore.signal()
      }

      let onTransportHttpError:(Error) -> () = { error in
        let error = E.prepareFor(.custom(error))
        completion(.failure(error as! E))
        signalDone()
      }

      let onRequestCancel = {
        signalDone()
      }

      let onFatalRefresh = {
        self.clearToken()
        self.session.invalidateAndCancel()

        let error = E.prepareFor(.reAuthRequired)
        completion(.failure(error as! E))
        signalDone()
      }

      let onRefreshTokenEvent = {
        if let tokenPair = self.fitBitAuth.tokenProvider.tokenPair {
          self.fitBitAuth.refreshToken(tokenPair) { (refreshResult) in
            switch refreshResult {
              case .failure:
                // fatal  - can't refresh
                onFatalRefresh()
              case .success:
                // repeat request on success, token auto updated
                signalDone()
                self.execute(request, completion: completion)
            }
          }
        } else {
          // no stored tokens require re-auth
          onFatalRefresh()
        }
      }

      let onResponseSuccess = {
        if let data = data {
          if let object: T = request.mapper?(data) {
            // success
            completion(.success(object))
          } else {
            // unknown response error
            let error = E.prepareFor(.unknownResponse)
            completion(.failure(error as! E))
          }
        } else {
          // data null error
          let error = E.prepareFor(.dataNull)
          completion(.failure(error as! E))
        }

        signalDone()
      }

      let onResponseError = {
        if let data = data {
          if let error: E = request.errorMapper?(data) {
            // error from server
            completion(.failure(error))
          } else {
            // error during error decoding
            let error = E.prepareFor(.decodingError)
            completion(.failure(error as! E))
          }
        } else {
          // data null for error
          let error = E.prepareFor(.dataNull)
          completion(.failure(error as! E))
        }
      }

      if let error = error {
        onTransportHttpError(error)
      } else if let httpResponseStatusCode = NetworkHttpStatusCode(HTTPResponse: response) {

        if httpResponseStatusCode.rawValue == NSURLErrorCancelled {
          onRequestCancel()
        } else if httpResponseStatusCode == .unauthorized {
          onRefreshTokenEvent()
        } else if httpResponseStatusCode.isSuccess {
          onResponseSuccess()
        } else if httpResponseStatusCode.isServerError ||
          httpResponseStatusCode.isClientError {
          onResponseError()
        }
      }

    }

    executionQueue.async {
      self.semaphore.wait()
      task.resume()
    }

    return task
  }

  // MARK: - Private

  private func configureHeadersFor(_ request: URLRequest) -> [String: String] {
    var allheaders: [String: String] = [ :]
    if let headers = request.allHTTPHeaderFields {
      allheaders = headers
    }

    if let accessHeaders = self.fitBitAuth.tokenProvider.accessHTTPHeaders() {
      allheaders = allheaders.merging(accessHeaders) { $1 }
    }

    return allheaders
  }

  // MARK: - Debug support

  private func printDebugOutput<T, E>(_ request: FitBitRequest<T, E>, response: URLResponse?, responseData: Data?, error: Swift.Error?) {
    if FitBitSettings.enableDebugOutput {
      print("---->")
      if let url = response?.url?.absoluteURL {
        print("Full url:    \(url))")
      }

      print("EndPoint:    \(request.HTTPMethod.rawValue) \(request.completeEndPoint)" )
      print("URL Params:  \(request.urlParameters.debugDescription)")
      print("Body Params: \(request.bodyParameters.debugDescription)")
      print("Headers:     \(request.headers.debugDescription)")

      if let responseData = responseData {
        if let json = try? JSONSerialization
          .jsonObject(with: responseData, options: []) as? [String: Any] {
          print("<----\n\(json)" )
        } else {
          print("<----\n\(String(describing: responseData.debugDescription))" )
        }
      }

      if let error = error {
        print("<----\n\(String(describing: error))" )
      }
    }
  }
}
