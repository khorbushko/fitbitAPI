//
//  File.swift
//  
//
//  Created by Kyryl Horbushko on 29.07.2020.
//   https://medium.com/ios-os-x-development/
//                strongly-typed-access-to-info-plist-file-using-swift-50e78d5abf96

import Foundation

private enum Resource {

  enum Extension {

    static let plist = "plist"
  }
}

// A class to read and decode strongly typed values in `plist` files.
internal class PListFile<T: Codable> {

  /// Errors.
  ///
  /// - fileNotFound: plist file not exists.
  internal enum Errors: Error {

    case fileNotFound
  }

  /// Plist file source.
  ///
  /// - infoPlist: main bundel's Info.plist file
  /// - plist: other plist file with custom name
  internal enum Source {

    case infoPlist(bundle: Bundle)
    case plist(name: String, bundle: Bundle)

    /// Get the raw data inside given plist file.
    ///
    /// - Returns: read data
    /// - Throws: throw an exception if it fails
    internal func data() throws -> Data {
      switch self {
        case .infoPlist(let bundle):
          guard let infoDict = bundle.infoDictionary else {
            throw Errors.fileNotFound
          }
          return try JSONSerialization.data(withJSONObject: infoDict)
        case .plist(let filename, let bundle):
          guard let path = bundle.path(forResource: filename, ofType: Resource.Extension.plist) else {
            throw Errors.fileNotFound
          }
          return try Data(contentsOf: URL(fileURLWithPath: path))
      }
    }
  }

  /// Data read for file
  internal let data: T

  /// Initialize a new Plist parser with given codable structure.
  ///
  /// - Parameter file: source of the plist
  /// - Throws: throw an exception if read fails
  internal init(_ file: PListFile.Source = .infoPlist(bundle: Bundle.main)) throws {
    let rawData = try file.data()
    let decoder = JSONDecoder()
    self.data = try decoder.decode(T.self, from: rawData)
  }
}
