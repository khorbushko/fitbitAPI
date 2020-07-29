//
//  DailyActivitiesRequest.swift
//  fibi
//
//  Created by Kyryl Horbushko on 29.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

final class DailyActivitiesRequest: FitBitRequest<FitBitDailyActivities, FitBitError> {

  override var HTTPMethod: NetworkRequestType {
    .GET
  }

  override var endPoint: String {
    FitBitEndPoint.Resources.dailyActivities
  }

  override var endPointResources: [FitBitAPI.ResourceValuePair]? {
    [
      ("<DAY>", date.toString(.yyyyMMdd))
    ]
  }

  private let date: Date

  // MARK: - Lifecycle

  init(date: Date) {
    self.date = date
  }
}
