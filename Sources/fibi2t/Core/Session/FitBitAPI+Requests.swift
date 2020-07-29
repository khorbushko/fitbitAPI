//
//  FitBitAPI+Requests.swift
//  fibi
//
//  Created by Kyryl Horbushko on 29.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

public extension FitBitAPI {

  // MARK: - Profile

  func fetchUserProfile(_ completion: @escaping FitBitAPI.CompletionHandler<FitBitProfile, FitBitError>) {
    let requestToExecute = ProfileRequest()
    execute(requestToExecute, completion: completion)
  }

  // MARK: - Summary

  func fetchUserDailyActivitiesSummary(_ date: Date,
                                       completion: @escaping FitBitAPI.CompletionHandler<FitBitDailyActivities, FitBitError>) {
    let requestToExecute = DailyActivitiesRequest(date: date)
    execute(requestToExecute, completion: completion)
  }

  // MARK: - Steps

  func fetchUserStepsActivitiesByPeriod(_ fromDate: Date,
                                        toDate: Date,
                                        reportType: ReportType,
                                       completion: @escaping FitBitAPI.CompletionHandler<FitBitReportResult, FitBitError>) {
    switch reportType {
      case .all:
        fetchUserAllStepsActivitiesByPeriod(fromDate, toDate: toDate, completion: completion)
      case .tracker:
        fetchUserTrackerStepsActivitiesByPeriod(fromDate, toDate: toDate, completion: completion)
    }
  }

  private func fetchUserAllStepsActivitiesByPeriod(_ fromDate: Date,
                                        toDate: Date,
                                        completion: @escaping FitBitAPI.CompletionHandler<FitBitReportResult, FitBitError>) {

    let requestToExecute = StepReportRequest(fromDate: fromDate, toDate: toDate)
    execute(requestToExecute, completion: { result in
      switch result {
        case .failure(let error):
          completion(.failure(error))
        case .success(let report):
          completion(.success(report))
      }
    })
  }

  private func fetchUserTrackerStepsActivitiesByPeriod(_ fromDate: Date,
                                                   toDate: Date,
                                                   completion: @escaping FitBitAPI.CompletionHandler<FitBitReportResult, FitBitError>) {

    let requestToExecute = TrackerStepReportRequest(fromDate: fromDate, toDate: toDate)
    execute(requestToExecute, completion: { result in
      switch result {
        case .failure(let error):
          completion(.failure(error))
        case .success(let report):
          completion(.success(report))
      }
    })
  }

  // MARK: - Calories

  func fetchUserCaloriesActivitiesByPeriod(_ fromDate: Date,
                                        toDate: Date,
                                        reportType: ReportType,
                                        completion: @escaping FitBitAPI.CompletionHandler<FitBitReportResult, FitBitError>) {
    switch reportType {
      case .all:
        fetchUserAllCaloriesActivitiesByPeriod(fromDate, toDate: toDate, completion: completion)
      case .tracker:
        fetchUserTrackerCaloriesActivitiesByPeriod(fromDate, toDate: toDate, completion: completion)
    }
  }

  private func fetchUserAllCaloriesActivitiesByPeriod(_ fromDate: Date,
                                                   toDate: Date,
                                                   completion: @escaping FitBitAPI.CompletionHandler<FitBitReportResult, FitBitError>) {

    let requestToExecute = CaloriesReportRequest(fromDate: fromDate, toDate: toDate)
    execute(requestToExecute, completion: { result in
      switch result {
        case .failure(let error):
          completion(.failure(error))
        case .success(let report):
          completion(.success(report))
      }
    })
  }

  private func fetchUserTrackerCaloriesActivitiesByPeriod(_ fromDate: Date,
                                                       toDate: Date,
                                                       completion: @escaping FitBitAPI.CompletionHandler<FitBitReportResult, FitBitError>) {

    let requestToExecute = TrackerCaloriesReportRequest(fromDate: fromDate, toDate: toDate)
    execute(requestToExecute, completion: { result in
      switch result {
        case .failure(let error):
          completion(.failure(error))
        case .success(let report):
          completion(.success(report))
      }
    })
  }

  // MARK: - Distance

  func fetchUserDistanceActivitiesByPeriod(_ fromDate: Date,
                                           toDate: Date,
                                           reportType: ReportType,
                                           completion: @escaping FitBitAPI.CompletionHandler<FitBitReportResult, FitBitError>) {
    switch reportType {
      case .all:
        fetchUserAllDistanceActivitiesByPeriod(fromDate, toDate: toDate, completion: completion)
      case .tracker:
        fetchUserTrackerDistanceActivitiesByPeriod(fromDate, toDate: toDate, completion: completion)
    }
  }

  private func fetchUserAllDistanceActivitiesByPeriod(_ fromDate: Date,
                                                      toDate: Date,
                                                      completion: @escaping FitBitAPI.CompletionHandler<FitBitReportResult, FitBitError>) {

    let requestToExecute = DistanceReportRequest(fromDate: fromDate, toDate: toDate)
    execute(requestToExecute, completion: { result in
      switch result {
        case .failure(let error):
          completion(.failure(error))
        case .success(let report):
          completion(.success(report))
      }
    })
  }

  private func fetchUserTrackerDistanceActivitiesByPeriod(_ fromDate: Date,
                                                          toDate: Date,
                                                          completion: @escaping FitBitAPI.CompletionHandler<FitBitReportResult, FitBitError>) {

    let requestToExecute = TrackerDistanceReportRequest(fromDate: fromDate, toDate: toDate)
    execute(requestToExecute, completion: { result in
      switch result {
        case .failure(let error):
          completion(.failure(error))
        case .success(let report):
          completion(.success(report))
      }
    })
  }
}
