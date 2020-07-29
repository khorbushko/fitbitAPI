//
//  EndPoints.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

enum FitBitEndPoint {

  enum Auth {

    /// https://dev.fitbit.com/build/reference/web-api/oauth2/#authorization-page
    static let authURL = URL(string: "https://www.fitbit.com/oauth2/authorize")

    /// https://dev.fitbit.com/build/reference/web-api/oauth2/#authorization-page
    static let tokenURL = URL(string: "https://api.fitbit.com/oauth2/token")

    /// https://dev.fitbit.com/build/reference/web-api/oauth2/#revoking-tokens
    static let revokeTokenURL = URL(string: "https://api.fitbit.com/oauth2/revoke")

    /// https://dev.fitbit.com/build/reference/web-api/oauth2/#retrieve-state-of-tokens
    static let introspectTokenURL = URL(string: "https://api.fitbit.com/1.1/oauth2/introspect")
  }

  /// The base url for all api calls from `Resources`
  ///
  static let baseURL = URL(string:"https://api.fitbit.com")!

  enum Resources {

    /// Return user profile
    ///
    ///
    /// POST
    ///
    /// - `user-id`  The encoded ID of the user. Use "-" (dash) for current logged-in user.
    ///
    static let profile: String = "1/user/-/profile.json"

    ///
    /// Return user activities for selected day
    ///
    ///
    /// GET
    ///
    /// - `user-id`  The encoded ID of the user. Use "-" (dash) for current logged-in user.
    /// - `<DAY>`    The date in the format yyyy-MM-dd
    ///
    static let dailyActivities: String = "/1/user/-/activities/date/<DAY>.json"

    /// There are two acceptable formats for retrieving activity time series data:
    ///
    ///
    ///     GET /1/user/[user-id]/[resource-path]/date/[date]/[period].json
    ///     GET /1/user/[user-id]/[resource-path]/date/[base-date]/[end-date].json
    ///
    /// - `user-id`  The encoded ID of the user. Use "-" (dash) for current logged-in user.
    /// - `resource-path`  The resource path; see options in the "Resource Path Options" section below.
    /// - `base-date`  The range start date, in the format yyyy-MM-dd or today.
    /// - `end-date`  The end date of the range.
    /// - `date`  The end date of the period specified in the format yyyy-MM-dd or today.
    /// - `period`  The range for which data will be returned. Options are 1d, 7d, 30d, 1w, 1m, 3m, 6m, 1y
    ///
    /// ### Calorie Time Series Differences
    ///
    /// - `activities/calories` - The top level time series for calories burned inclusive of BMR, tracked activity, and manually logged activities.
    ///
    /// - `activities/caloriesBMR` - Only BMR calories.
    ///
    /// - `activities/activityCalories` - The number of calories burned during the day for periods of time when the user was active above sedentary level. This value is calculated minute by minute for minutes that fall under this criteria. This includes BMR for those minutes as well as activity burned calories.
    ///
    /// - `activities/tracker/calories` - Calories burned inclusive of BMR according to movement captured by a Fitbit tracker.
    ///
    /// - `activities/tracker/activityCalories` - Calculated similarly to activities/activityCalories, but uses only tracker data. This means that manually logged activities are excluded.
    ///
    /// https://dev.fitbit.com/build/reference/web-api/activity/#activity-time-series
    ///
    enum Reports {

      /// Resource represents the daily activity values logged by the tracker device only,
      /// INCLUDING manual activity log entries.
      ///
      ///
      /// - activities/calories
      /// - activities/caloriesBMR
      /// - activities/steps
      /// - activities/distance
      /// - activities/floors
      /// - activities/elevation
      /// - activities/minutesSedentary
      /// - activities/minutesLightlyActive
      /// - activities/minutesFairlyActive
      /// - activities/minutesVeryActive
      /// - activities/activityCalories
      ///
      enum All {

        ///
        /// Return user steps activities for selected day's range
        ///
        ///
        /// GET
        ///
        static let steps: String = "/1/user/-/activities/steps/date/<START-DAY>/<END-DAY>.json"

        ///
        /// Return user calories activities for selected day's range
        ///
        ///
        /// GET
        ///
        static let calories: String = "/1/user/-/activities/calories/date/<START-DAY>/<END-DAY>.json"

        ///
        /// Return user distance activities for selected day's range
        ///
        ///
        /// GET
        ///
        static let distance: String = "/1/user/-/activities/distance/date/<START-DAY>/<END-DAY>.json"
      }

      /// Resource represents the daily activity values logged by the tracker device only,
      /// EXCLUDING manual activity log entries.
      ///
      ///
      /// - activities/tracker/calories
      /// - activities/tracker/steps
      /// - activities/tracker/distance
      /// - activities/tracker/floors
      /// - activities/tracker/elevation
      /// - activities/tracker/minutesSedentary
      /// - activities/tracker/minutesLightlyActive
      /// - activities/tracker/minutesFairlyActive
      /// - activities/tracker/minutesVeryActive
      /// - activities/tracker/activityCalories
      ///
      enum Tracker {

        ///
        /// Return user steps activities for selected day's range
        ///
        ///
        /// GET
        ///
        static let steps: String = "/1/user/-/activities/tracker/steps/date/<START-DAY>/<END-DAY>.json"

        ///
        /// Return user calories activities for selected day's range
        ///
        ///
        /// GET
        ///
        static let calories: String = "/1/user/-/activities/tracker/calories/date/<START-DAY>/<END-DAY>.json"

        ///
        /// Return user distance activities for selected day's range
        ///
        ///
        /// GET
        ///
        static let distance: String = "/1/user/-/activities/tracker/distance/date/<START-DAY>/<END-DAY>.json"
      }
    }
  }
}
