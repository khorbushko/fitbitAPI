//
//  FitBitAuth.swift
//  fibi
//
//  Created by Kyryl Horbushko on 27.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

public extension FitBitAuth {

  typealias CompletionHandler = (URL?, Swift.Error?) -> Void
  typealias FitBitResponse<T> = (Result<T, FitBitAuth.Error>) -> Void
}

/// This class incapsulate logic related to login
/// and handle refresh/access tokens
final public class FitBitAuth: AuthHandlerType {

  public enum Error: Swift.Error {

    case invalidAuthURl
    case invalidAuthConfig
    case invalidAuthResponse
    case invalidAuthResponseNoCode

    case invalidTokenURl
    case invalidTokenConfig
    case invalidTokenExchangeNoData

    case authError(Swift.Error)

    case canceledByUser
  }

  public let tokenProvider: FitBitTokenProvidable

  /// auth session
  internal var session: NSObject?
  /// AuthContextProvider
  internal var contextProvider: NSObject?

  private let config: FitBitConfig

  // MARK: - LifeCycle

  internal init(config: FitBitConfig, tokenProvider: FitBitTokenProvidable) {
    self.config = config
    self.tokenProvider = tokenProvider
  }

  // MARK: - Public

  internal func auth(_ completion: @escaping FitBitResponse<FitBitCode>) {

    if let authURL = FitBitEndPoint.Auth.authURL {

      var urlComponents = URLComponents(url: authURL, resolvingAgainstBaseURL: false)
      urlComponents?.queryItems = config.toQueryItems()

      if let url = urlComponents?.url {

        Debug.print("startAuth \(url)")
        performAuth(url: url, callbackScheme: config.redirectScheme) {
          url, error in
          if let authError = error {
            if authError._code == 1 {
              completion(.failure(.canceledByUser))
            } else {
              completion(.failure(.authError(authError)))
            }
          } else if let url = url,
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false) {

            switch self.config.authType {
              case .code:
                let item = components.queryItems?.first(where: { $0.name == "code" })
                if let code = item?.value {
                  let token = FitBitCode(code: code, type: self.config.authType)
                  Debug.print("token \(token.code)")
                  completion(.success(token))
                } else {
                  completion(.failure(.invalidAuthResponseNoCode))
              }
              case .token:
                let item = components.queryItems?.first(where: { $0.name == "#access_token" })
                if let accessToken = item?.value {
                  let token = FitBitCode(code: accessToken, type: self.config.authType)
                  Debug.print("token \(token.code)")
                  completion(.success(token))
                } else {
                  completion(.failure(.invalidAuthResponseNoCode))
              }
            }

          } else {
            completion(.failure(.invalidAuthResponse))
          }

        }
      } else {
        completion(.failure(.invalidAuthConfig))
      }

    } else {
      completion(.failure(.invalidAuthURl))
    }
  }

  /// Perform code exhange for refresh and accessToken
  /// auth type - code
  ///
  /// When a user authorizes your application in the Authorization Code Grant Flow, your application must exchange the authorization code for an access token. The code is only valid for 10 minutes.
  ///
  /// https://dev.fitbit.com/build/reference/web-api/oauth2/#access-token-request
  internal func exchangeCodeForToken(code: FitBitCode, completion: @escaping FitBitResponse<FitBitTokenPair>) {

    if let requestURL = FitBitEndPoint.Auth.tokenURL {

      var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false)
      urlComponents?.queryItems = [
        URLQueryItem(name: "code", value: code.code),
        URLQueryItem(name: "grant_type", value: "authorization_code"),
        URLQueryItem(name: "client_id", value: config.clientId),
        URLQueryItem(name: "redirect_uri", value: config.redirectURL),
        URLQueryItem(name: "expires_in", value: String(Int(config.expireTime)))
      ]

      let authDataBase64 = "\(config.clientId):\(config.clientSecret)"
        .data(using: .utf8)?
        .base64EncodedString()

      if let url = urlComponents?.url,
        let authDataBase64 = authDataBase64 {

        Debug.print("start exchangeCodeForToken \(url)")

        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30)
        urlRequest.allHTTPHeaderFields = [
          HTTPHeader.Key.authorization: "Basic \(authDataBase64)",
          HTTPHeader.Key.contentType: HTTPEncoding.urlEncoded
        ]
        Debug.print("headers \(urlRequest.allHTTPHeaderFields ?? [: ])")
        urlRequest.httpMethod = NetworkRequestType.POST.rawValue

        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, response, error) in
          if let error = error {
            completion(.failure(.authError(error)))
          } else if let value = data,
            let json = String(data: value, encoding: .utf8) {
            Debug.print("response \(json)")

            do {
              let object = try FitBitTokenPair.decodeFrom(json)
              self.tokenProvider.tokenPair = object

              completion(.success(object))
            } catch {
              completion(.failure(.authError(error)))
            }

          } else {
            completion(.failure(.invalidTokenExchangeNoData))
          }
        }.resume()

      } else {
        completion(.failure(.invalidTokenConfig))
      }

    } else {
      completion(.failure(.invalidTokenURl))
    }
  }

  /// Perform refresh token request
  ///
  /// An access token intentionally is short lived. This is an important security mechanism of OAuth 2.0. When using the Authorization Code Grant Flow, the access tokens have an eight-hour lifetime by default.
  ///
  /// When an access token expires, an HTTP 401 error will be returned:
  ///
  ///      {
  ///        "errors": [
  ///                    {
  ///                    "errorType": "expired_token",
  ///                    "message": "Access token expired: eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0MzAzNDM3MzUsInNjb3BlcyI6Indwcm8gd2xvYyB3bnV0IHdzbGUgd3NldCB3aHIgd3dlaSB3YWN0IHdzb2MiLCJzdWIiOiJBQkNERUYiLCJhdWQiOiJJSktMTU4iLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJpYXQiOjE0MzAzNDAxMzV9.z0VHrIEzjsBnjiNMBey6wtu26yHTnSWz_qlqoEpUlpc"
  ///                   }
  ///       ]
  ///     }
  ///
  /// Your application will need to refresh the access token. The Fitbit API follows the OAuth 2.0 specification for refreshing access tokens. A refresh token does not expire until it is used. A refresh token can only be used once, as a new refresh token is returned with the new access token.
  ///
  /// If a client makes identical refresh token requests within a two-minute period, the Fitbit Web API will return the same response. This is to assist applications unable to coordinate the refresh token flow between processes.
  ///
  /// https://dev.fitbit.com/build/reference/web-api/oauth2/#refreshing-tokens
  internal func refreshToken(_ currentPair: FitBitTokenPair,
                    completion: @escaping FitBitResponse<FitBitTokenPair>) {

    if let requestURL = FitBitEndPoint.Auth.tokenURL {

      var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false)
      urlComponents?.queryItems = [
        URLQueryItem(name: "refresh_token", value: currentPair.refreshToken),
        URLQueryItem(name: "grant_type", value: "refresh_token"),
        URLQueryItem(name: "expires_in", value: String(Int(config.expireTime)))
      ]

      let authDataBase64 = "\(config.clientId):\(config.clientSecret)"
        .data(using: .utf8)?
        .base64EncodedString()

      if let url = urlComponents?.url,
        let authDataBase64 = authDataBase64 {

        Debug.print("start refreshToken \(url)")

        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30)
        urlRequest.allHTTPHeaderFields = [
          HTTPHeader.Key.authorization: "Basic \(authDataBase64)",
          HTTPHeader.Key.contentType: HTTPEncoding.urlEncoded
        ]
        Debug.print("headers \(urlRequest.allHTTPHeaderFields ?? [: ])")
        urlRequest.httpMethod = NetworkRequestType.POST.rawValue

        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, response, error) in
          if let error = error {
            completion(.failure(.authError(error)))
          } else if let value = data,
            let json = String(data: value, encoding: .utf8) {
            Debug.print("response \(json)")

            do {
              let object = try FitBitTokenPair.decodeFrom(json)
              self.tokenProvider.tokenPair = object

              completion(.success(object))
            } catch {
              completion(.failure(.authError(error)))
            }

          } else {
            completion(.failure(.invalidTokenExchangeNoData))
          }
        }.resume()

      } else {
        completion(.failure(.invalidTokenConfig))
      }

    } else {
      completion(.failure(.invalidTokenURl))
    }
  }

  /// Revoking Tokens
  ///
  /// There may be a requirement to disable a user's authorization for an application. The revoke endpoint, specifying either the access token or refresh token, will remove the user's authorizations and all associated tokens. This endpoint conforms to RFC 7009.
  ///
  /// Revoking the access token or refresh token will provide the same result. When the token is revoked, all tokens are revoked for that user. If an application has multiple sessions (web, mobile, etc.) for the same user, the revocation will remove all sessions (web, mobile, etc.) associated with that user.
  ///
  /// https://dev.fitbit.com/build/reference/web-api/oauth2/#revoking-tokens
  internal func revokeAllTokenAndSessions(_ currentPair: FitBitTokenPair,
                                          completion: @escaping FitBitResponse<FitBitSuccess>) {

    if let requestURL = FitBitEndPoint.Auth.revokeTokenURL {

      var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false)
      urlComponents?.queryItems = [
        URLQueryItem(name: "token", value: currentPair.refreshToken)
      ]

      let authDataBase64 = "\(config.clientId):\(config.clientSecret)"
        .data(using: .utf8)?
        .base64EncodedString()

      if let url = urlComponents?.url,
        let authDataBase64 = authDataBase64 {

        Debug.print("start refreshToken \(url)")

        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30)
        urlRequest.allHTTPHeaderFields = [
          HTTPHeader.Key.authorization: "Basic \(authDataBase64)",
          HTTPHeader.Key.contentType: HTTPEncoding.urlEncoded
        ]
        Debug.print("headers \(urlRequest.allHTTPHeaderFields ?? [: ])")
        urlRequest.httpMethod = NetworkRequestType.POST.rawValue

        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, response, error) in
          if let error = error {
            completion(.failure(.authError(error)))
          } else if let value = data {
            do {
              let decoder = JSONDecoder()
              let object = try decoder.decode(FitBitSuccess.self, from: value)
              self.clearStoredToken()

              completion(.success(object))
            } catch {
              completion(.failure(.authError(error)))
            }

          } else {
            completion(.failure(.invalidTokenExchangeNoData))
          }
        }.resume()

      } else {
        completion(.failure(.invalidTokenConfig))
      }

    } else {
      completion(.failure(.invalidTokenURl))
    }
  }

  /// The Introspect endpoint allows an application to retrieve the active state of an OAuth 2.0 token. This endpoint conforms to RFC 7662.
  ///
  /// https://dev.fitbit.com/build/reference/web-api/oauth2/#retrieve-state-of-tokens
  internal func introspectToken(_ currentPair: FitBitTokenPair,
                                completion: @escaping FitBitResponse<FitBitTokenInfo>) {

    if let requestURL = FitBitEndPoint.Auth.introspectTokenURL {

      var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false)
      urlComponents?.queryItems = [
        URLQueryItem(name: "token", value: currentPair.accessToken)
      ]

      if let url = urlComponents?.url {

        Debug.print("start refreshToken \(url)")

        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30)
        urlRequest.allHTTPHeaderFields = [
          HTTPHeader.Key.authorization: "Bearer \(currentPair.accessToken)",
          HTTPHeader.Key.contentType: HTTPEncoding.urlEncoded
        ]
        Debug.print("headers \(urlRequest.allHTTPHeaderFields ?? [: ])")
        urlRequest.httpMethod = NetworkRequestType.POST.rawValue

        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, response, error) in
          if let error = error {
            completion(.failure(.authError(error)))
          } else if let value = data {
            do {
              let decoder = JSONDecoder()
              let object = try decoder.decode(FitBitTokenInfo.self, from: value)
              self.clearStoredToken()

              completion(.success(object))
            } catch {
              completion(.failure(.authError(error)))
            }

          } else {
            completion(.failure(.invalidTokenExchangeNoData))
          }
        }.resume()

      } else {
        completion(.failure(.invalidTokenConfig))
      }

    } else {
      completion(.failure(.invalidTokenURl))
    }
  }

  /// Clean up internal storage
  internal func clearStoredToken() {
    self.tokenProvider.removeTokens()
  }
}
