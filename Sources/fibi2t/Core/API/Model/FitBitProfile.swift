//
//  FitBitProfile.swift
//  fibi
//
//  Created by Kyryl Horbushko on 28.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

/*
 {
    "user": {
       "age": 31,
       "ambassador": false,
       "avatar": "https://static0.fitbit.com/images/profile/defaultProfile_100.png",
       "avatar150": "https://static0.fitbit.com/images/profile/defaultProfile_150.png",
       "avatar640": "https://static0.fitbit.com/images/profile/defaultProfile_640.png",
       "averageDailySteps": 5602,
       "challengesBeta": true,
       "clockTimeDisplayFormat": "12hour",
       "corporate": false,
       "corporateAdmin": false,
       "dateOfBirth": "1988-08-30",
       "displayName": "Kyryl H.",
       "displayNameSetting": "name",
       "distanceUnit": "METRIC",
       "encodedId": "8MHHY7",
       "features": {
          "exerciseGoal": true
          },
       "firstName": "Kyryl",
       "foodsLocale": "en_US",
       "fullName": "Kyryl Horbushko",
       "gender": "MALE",
       "glucoseUnit": "en_US",
       "height": 172.0,
       "heightUnit": "METRIC",
       "isBugReportEnabled": false,
       "isChild": false,
       "isCoach": false,
       "languageLocale": "en_US",
       "lastName": "Horbushko",
       "legalTermsAcceptRequired": false,
       "locale": "en_US",
       "memberSince": "2020-07-01",
       "mfaEnabled": false,
       "offsetFromUTCMillis": 10800000,
       "sdkDeveloper": false,
       "sleepTracking": "Normal",
       "startDayOfWeek": "SUNDAY",
       "strideLengthRunning": 106.5,
       "strideLengthRunningType": "default",
       "strideLengthWalking": 71.4,
       "strideLengthWalkingType": "default",
       "swimUnit": "METRIC",
       "timezone": "Europe/Kiev",
       "topBadges": [
           {
           "badgeType":"DAILY_FLOORS",
           "dateTime":"2012-04-27",
           "image50px":"http://www.fitbit.com/images/dash/badge_daily_floors10.png",
           "image75px":"http://www.fitbit.com/images/dash/75px/badge_daily_floors10.png",
           "timesAchieved":3,
           "value":10
           }
         ],
       "waterUnit": "en_US",
       "waterUnitName": "fl oz",
       "weight": 82.0,
       "weightUnit": "METRIC"
     }
   }
  */

/// The Get Profile endpoint returns a user's profile. The authenticated owner receives all values. Access to other user's profile is not available. If you wish to retrieve the profile information of the authenticated owner's friends, use the Get Friends API. Numerical values are returned in the unit system specified in the Accept-Language header.
///
/// ## Considerations:
///
/// - The field is present at all times. It contains one of the following:
///
/// - The user's fullName.
///
/// - A portion of user's email address before the at sign, "@". This is used in the case where the fullName field is empty.
///
/// - The Units fields (<glucoseUnit>, etc.) represent default unit settings of the user's Web UI. The field is also used as a default for all other body measurements (such as neck, bicep, etc.).
///
/// - The field indicates the local website version currently used (such as, en_US, en_GB, etc.).
///
/// more - https://dev.fitbit.com/build/reference/web-api/user/
///
public final class FitBitProfile: Codable {

  public let age: Int
  public let ambassador: Bool
  public let avatar: String
  public let averageDailySteps: Int
  public let dateOfBirth: Date
  public let displayName: String
  public let displayNameSetting: String
  public let distanceUnit: MeasurementSystem
  public let encodedId: String
  public let features: FitBitUserFeatures
  public let firstName: String
  public let foodsLocale: String
  public let fullName: String
  public let gender: Gender
  public let glucoseUnit: MeasurementSystem
  public let height: Int
  public let heightUnit: MeasurementSystem
  public let sleepTracking: String
  public let startDayOfWeek: String
  public let lastName: String
  public let legalTermsAcceptRequired: Bool
  public let locale: String
  public let timezone: String
  public let weight: Int
  public let weightUnit: MeasurementSystem
  public let clockTimeDisplayFormat: ClockDisplayFormat

  private enum Key: String, CodingKey {

    case user

    case age
    case ambassador
    case avatar
    case averageDailySteps
    case dateOfBirth
    case displayName
    case displayNameSetting
    case distanceUnit
    case encodedId
    case features
    case firstName
    case foodsLocale
    case fullName
    case gender
    case glucoseUnit
    case height
    case heightUnit
    case sleepTracking
    case startDayOfWeek
    case lastName
    case legalTermsAcceptRequired
    case locale
    case timezone
    case weight
    case weightUnit
    case clockTimeDisplayFormat
  }

  required public init(from decoder: Decoder) throws {
    var container = try decoder.container(keyedBy: Key.self)
    if let subContainer = try? container.nestedContainer(keyedBy: Key.self, forKey: .user) {
      container = subContainer
    }

    age = try container.decode(.age)
    ambassador = try container.decode(.ambassador)
    avatar = try container.decode(.avatar)
    averageDailySteps = try container.decode(.averageDailySteps)
    dateOfBirth = try container.decode(.dateOfBirth)
    displayName = try container.decode(.displayName)
    displayNameSetting = try container.decode(.displayNameSetting)
    distanceUnit = try container.decode(.distanceUnit)
    encodedId = try container.decode(.encodedId)
    features = try container.decode(.features)
    firstName = try container.decode(.firstName)
    foodsLocale = try container.decode(.foodsLocale)
    fullName = try container.decode(.fullName)
    gender = try container.decode(.gender)
    glucoseUnit = try container.decode(.glucoseUnit)
    height = try container.decode(.height)
    heightUnit = try container.decode(.heightUnit)
    sleepTracking = try container.decode(.sleepTracking)
    startDayOfWeek = try container.decode(.startDayOfWeek)
    lastName = try container.decode(.lastName)
    legalTermsAcceptRequired = try container.decode(.legalTermsAcceptRequired)
    locale = try container.decode(.locale)
    timezone = try container.decode(.timezone)
    weight = try container.decode(.weight)
    weightUnit = try container.decode(.weightUnit)
    clockTimeDisplayFormat = try container.decode(.clockTimeDisplayFormat)
  }
}

public final class FitBitUserFeatures: Codable {

  public let exerciseGoal: Bool
}

public enum Gender: String, Codable {

  case male = "MALE"
  case female = "FEMALE"
  case unknown = "NA"
}

public enum ClockDisplayFormat: String, Codable {

  case hour12 = "12hour"
  case hour24 = "24hour"
}

public enum MeasurementSystem: String, Codable {

  case metric = "METRIC"
  case imperial = "en_US"
  case any = "any"
  case us = "us"
  case stone = "stone"
}
