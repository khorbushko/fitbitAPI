//
//  FitBitRequest.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

public class FitBitRequest<T: Codable, E: Swift.Error & Decodable & FitBitErrorConstructable> {

  open var urlParameters: [String: AnyObject]? {
    nil
  }

  open var headers: [String: String]? {
    nil
  }

  open var bodyParameters: AnyObject? {
    nil
  }

  open var HTTPMethod: NetworkRequestType {
    .UNKNOWN
  }

  open var endPoint: String {
    fatalError("override endPoint")
  }

  open var endPointResources: [FitBitAPI.ResourceValuePair]? {
    nil
  }

  final var completeEndPoint: String {
    if let endPointResources = endPointResources {
      var initialEndPoint = endPoint
      endPointResources.forEach { (pair) in
        initialEndPoint = initialEndPoint.replacingOccurrences(of: pair.0, with: pair.1)
      }

      return initialEndPoint
    } else {
      return endPoint
    }
  }

  // MARK: - Mappers

  open var mapper: FitBitAPI.FitBitRequestResult<Data, T>? = { data in
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")

    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(formatter)

    do {
      let object = try decoder.decode(T.self, from: data)
      return object
    } catch {
      Debug.print("decode error \(error))")
    }

    return nil
  }

  open var errorMapper: FitBitAPI.FitBitRequestResult<Data, E>? = { data in
    let decoder = JSONDecoder()

    let object = try? decoder.decode(E.self, from: data)
    return object
  }

  // MARK: - Lifecycle

  public init() { /* config */ }

  // MARK: - Internal

  func urlRequest() -> URLRequest {
    let baseURL = FitBitEndPoint.baseURL
    let fullURL = baseURL.appendingPathComponent(completeEndPoint)

    var returnRequest: URLRequest = URLRequest(url: fullURL)
    returnRequest.httpMethod = HTTPMethod.rawValue

    if let bodyParameters = bodyParameters {
      if let data = Data.jsonDataFromObj(bodyParameters) {
        returnRequest.httpBody = data
      }
    }

    return returnRequest
  }
}
