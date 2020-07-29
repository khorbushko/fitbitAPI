//
//  BaseTrackingReportRequest.swift
//  fibi
//
//  Created by Kyryl Horbushko on 29.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

class BaseTrackingReportRequest<T: Codable>: FitBitRequest<T, FitBitError> {

  override var HTTPMethod: NetworkRequestType {
    .GET
  }

  override var endPointResources: [FitBitAPI.ResourceValuePair]? {
    [
      ("<START-DAY>", fromDate.toString(.yyyyMMdd)),
      ("<END-DAY>", toDate.toString(.yyyyMMdd))
    ]
  }

  private let fromDate: Date
  private let toDate: Date

  // MARK: - Lifecycle

  init(fromDate: Date, toDate: Date) {
    self.fromDate = fromDate
    self.toDate = toDate
  }
}
