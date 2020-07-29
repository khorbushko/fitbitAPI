//
//  FitBitReportResult.swift
//  fibi
//
//  Created by Kyryl Horbushko on 29.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

/*
 {
   "<ACTIVITY NAME>": [
       {
         "dateTime": "2020-07-27",
         "value": "0.0"
       },
       {
         "dateTime": "2020-07-28",
         "value": "0.0"
       },
       {
         "dateTime": "2020-07-29",
         "value": "0.0"
       }
     ]
   }
 */

/// Represent report of data for activities
///
public class FitBitReportResult: Codable {

  public fileprivate (set) var result: [FitBitActivityDaySummaryReport] = []

  required public init(from decoder: Decoder) throws {
    /* dummy */
  }
}

/// Represent daily report of data
///
public final class FitBitActivityDaySummaryReport: Codable {

  public let dateTime: Date
  public let value: String

  public var doubleValue: Double? {
    Double(value) ?? 0.0
  }

  public var intValue: Int? {
    Int(value) ?? 0
  }
}

// MARK: - Steps

public enum ReportType {

  /// Resource represents the daily activity values logged by the tracker device only,
  /// INCLUDING manual activity log entries.
  case all

  /// Resource represents the daily activity values logged by the tracker device only,
  /// EXCLUDING manual activity log entries.
  case tracker
}

final public class FitBitStepsReportResult: FitBitReportResult {

  private enum Key: String, CodingKey {

    case data = "activities-steps"
  }

  required public init(from decoder: Decoder) throws {
    try super.init(from: decoder)

    let container = try decoder.container(keyedBy: Key.self)
    result = try container.decode(.data)
  }
}

final public class FitBitTrackerStepsReportResult: FitBitReportResult {

  private enum Key: String, CodingKey {

    case data = "activities-tracker-steps"
  }

  required public init(from decoder: Decoder) throws {
    try super.init(from: decoder)

    let container = try decoder.container(keyedBy: Key.self)
    result = try container.decode(.data)
  }
}

// MARK: - Calories

final public class FitBitCaloriesReportResult: FitBitReportResult {

  private enum Key: String, CodingKey {

    case data = "activities-calories"
  }

  required public init(from decoder: Decoder) throws {
    try super.init(from: decoder)

    let container = try decoder.container(keyedBy: Key.self)
    result = try container.decode(.data)
  }
}

final public class FitBitTrackerCaloriesReportResult: FitBitReportResult {

  private enum Key: String, CodingKey {

    case data = "activities-tracker-calories"
  }

  required public init(from decoder: Decoder) throws {
    try super.init(from: decoder)

    let container = try decoder.container(keyedBy: Key.self)
    result = try container.decode(.data)
  }
}

// MARK: - Distance

final public class FitBitDistanceReportResult: FitBitReportResult {

  private enum Key: String, CodingKey {

    case data = "activities-distance"
  }

  required public init(from decoder: Decoder) throws {
    try super.init(from: decoder)

    let container = try decoder.container(keyedBy: Key.self)
    result = try container.decode(.data)
  }
}

final public class FitBitTrackerDistanceReportResult: FitBitReportResult {

  private enum Key: String, CodingKey {

    case data = "activities-tracker-distance"
  }

  required public init(from decoder: Decoder) throws {
    try super.init(from: decoder)

    let container = try decoder.container(keyedBy: Key.self)
    result = try container.decode(.data)
  }
}
