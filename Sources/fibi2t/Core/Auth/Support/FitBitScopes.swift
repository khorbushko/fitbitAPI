//
//  FitBitScopes.swift
//  fibi
//
//  Created by Kyryl Horbushko on 27.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

/// https://dev.fitbit.com/build/reference/web-api/oauth2/#scope

public enum FitBitScopes {

  /// The activity scope includes activity data and exercise log related features, such as steps, distance, calories burned, and active minutes
  public static let activity = "activity"

  /// The heartrate scope includes the continuous heart rate data and related analysis
  public static let heartrate = "heartrate"

  /// The location scope includes the GPS and other location data
  public static let location = "location"

  /// The nutrition scope includes calorie consumption and nutrition related features, such as food/water logging, goals, and plans
  public static let nutrition = "nutrition"

  /// The profile scope is the basic user information
  public static let profile = "profile"

  /// The settings scope includes user account and device settings, such as alarms
  public static let settings = "settings"

  /// The sleep scope includes sleep logs and related sleep analysis
  public static let sleep = "sleep"

  /// The social scope includes friend-related features, such as friend list, invitations, and leaderboard
  public static let social = "social"

  /// The weight scope includes weight and related information, such as body mass index, body fat percentage, and goals
  public static let weight = "weight"

  public static var all: [String] {
    [
        FitBitScopes.activity,
        FitBitScopes.heartrate,
        FitBitScopes.location,
        FitBitScopes.nutrition,
        FitBitScopes.profile,
        FitBitScopes.settings,
        FitBitScopes.sleep,
        FitBitScopes.social,
        FitBitScopes.weight
    ]
  }
}
