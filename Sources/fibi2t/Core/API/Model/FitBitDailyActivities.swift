//
//  FitBitDailyActivities.swift
//  fibi
//
//  Created by Kyryl Horbushko on 29.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

/**
 {
   "activities": [
       {
         "activityId": 17151,
         "activityParentId": 90013,
         "activityParentName": "Walk",
         "calories": 684,
         "description": "Walking less than 2 mph, strolling very slowly",
         "distance": 4,
         "duration": 42900000,
         "hasActiveZoneMinutes": false,
         "hasStartTime": true,
         "isFavorite": false,
         "lastModified": "2020-07-27T12:53:34.000Z",
         "logId": 32955998291,
         "name": "Walk",
         "startDate": "2020-07-27",
         "startTime": "11:11",
         "steps": 5602
       }
     ],
     "goals": {
         "activeMinutes": 30,
         "caloriesOut": 2892,
         "distance": 8.05,
         "steps": 10000
       },
     "summary": {
       "activeScore": -1,
       "activityCalories": 1735,
       "caloriesBMR": 1746,
       "caloriesOut": 2614,
       "distances": [
         {
          "activity": "Walk",
          "distance": 4
         },
         {
          "activity": "total",
          "distance": 4
         },
         {
          "activity": "tracker",
          "distance": 0
         },
         {
          "activity": "loggedActivities",
          "distance": 4
         },
         {
          "activity": "veryActive",
          "distance": 0
         },
         {
          "activity": "moderatelyActive",
          "distance": 0
         },
         {
          "activity": "lightlyActive",
          "distance": 4
         },
         {
          "activity": "sedentaryActive",
          "distance": 0
         }
       ],
     "fairlyActiveMinutes": 0,
     "lightlyActiveMinutes": 715,
     "marginalCalories": 0,
     "sedentaryMinutes": 725,
     "steps": 5602,
     "veryActiveMinutes": 0
   }
 }
 */

/// Daily activities
///
/// A summary and list of a user's activities and activity log entries for a given day in the format requested using units in the unit system which corresponds to the Accept-Language header provided.
///
/// https://dev.fitbit.com/build/reference/web-api/activity/#get-daily-activity-summary
///
public final class FitBitDailyActivities: Codable {

  public let activities: [FitBitActivity]
  public let goals: FitBitGoals?
  public let summary: FitBitActivitiesSummary?
}

public final class FitBitActivity: Codable {

  public let activityId: Int
  public let activityParentId: Int
  public let activityParentName: String
  public let calories: Int
  public let activityDescription: String
  public let distance: Int?
  public let duration: Int?
  public let hasActiveZoneMinutes: Bool
  public let hasStartTime: Bool
  public let isFavorite: Bool
  public let lastModified: String
  public let logId: Int
  public let name: String
  public let startDate: String
  public let startTime: String
  public let steps: Int?
}

public final class FitBitGoals: Codable {

  public let activeMinutes: Int
  public let caloriesOut: Int?
  public let distance: Double?
  public let steps: Int?
}

public final class FitBitActivitiesSummary: Codable {

  public let activeScore: Int
  public let activityCalories: Int
  public let caloriesBMR: Int
  public let caloriesOut: Int?
  public let distances: [FitBitDistanceActivity]?
  public let fairlyActiveMinutes: Int
  public let lightlyActiveMinutes: Int
  public let marginalCalories: Int
  public let sedentaryMinutes: Int
  public let steps: Int?
  public let veryActiveMinutes: Int
  public let floors: Int?
  public let elevation: Int?
}

public final class FitBitDistanceActivity: Codable {

  public let activity: String
  public let distance: Int?
}
