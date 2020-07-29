//
//  File.swift
//  
//
//  Created by Kyryl Horbushko on 29.07.2020.
//

import UIKit

// MARK: - URLScheme

typealias URLScheme = String

// MARK: - URLType

struct URLType: Codable {

  internal private (set) var role: String?
  internal private (set) var iconFile: String?
  internal private (set) var name: String?
  internal private (set) var urlSchemes: [String]

  // MARK: - Codable

  private enum Key: String, CodingKey {

    case role = "CFBundleTypeRole"
    case iconFile = "CFBundleURLIconFile"
    case urlSchemes = "CFBundleURLSchemes"
    case name = "CFBundleURLName"
  }

  internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: URLType.Key.self)

    role = try container.decode(String.self, forKey: .role)
    iconFile = try container.decodeIfPresent(String.self, forKey: .iconFile)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    urlSchemes = try container.decode([String].self, forKey: .urlSchemes)
  }
}

// MARK: - InfoPlist

internal struct InfoPlist: Codable {

  internal private (set) var displayName: String?
  internal private (set) var bundleId: String
  internal private (set) var bundleName: String?
  internal private (set) var versionNumber: String?
  internal private (set) var buildNumber: String?

  internal private (set) var urlTypes: [URLType]?

  // MARK: - Codable

  private enum Key: String, CodingKey {

    case displayName = "CFBundleDisplayName"
    case bundleName = "CFBundleName"

    case bundleId = "CFBundleIdentifier"
    case versionNumber = "CFBundleShortVersionString"
    case buildNumber = "CFBundleVersion"

    case urlTypes = "CFBundleURLTypes"
  }

  internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: InfoPlist.Key.self)

    bundleId = try container.decode(String.self, forKey: .bundleId)
    versionNumber = try container.decode(String.self, forKey: .versionNumber)
    buildNumber = try container.decode(String.self, forKey: .buildNumber)

    displayName = try? container.decodeIfPresent(String.self, forKey: .displayName)
    bundleName = try? container.decodeIfPresent(String.self, forKey: .bundleName)

    urlTypes = try? container.decodeIfPresent([URLType].self, forKey: .urlTypes)
  }
}
