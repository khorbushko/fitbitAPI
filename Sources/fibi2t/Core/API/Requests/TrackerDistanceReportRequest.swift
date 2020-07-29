//
//  TrackerDistanceReportRequest.swift
//  fibi
//
//  Created by Kyryl Horbushko on 29.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

final class TrackerDistanceReportRequest: BaseTrackingReportRequest<FitBitTrackerDistanceReportResult> {

  override var endPoint: String {
    FitBitEndPoint.Resources.Reports.Tracker.distance
  }
}
