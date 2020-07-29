//
//  Date+StringRepresentation.swift
//  fibi
//
//  Created by Kyryl Horbushko on 29.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

extension Date {

  /*!
   # Character  Example  Description

   ## Year
   yy  08  2-digit year
   yyyy  2008  4-digit year

   ## Quarter
   Q  4  The quarter of the year. Use QQ if you want zero padding.
   QQQ  Q4  Quarter including "Q"
   QQQQ  4th quarter  Quarter spelled out

   ## Month
   M  12  The numeric month of the year. A single M will use '1' for January.
   MM  12  The numeric month of the year. A double M will use '01' for January.
   MMM  Dec  The shorthand name of the month
   MMMM  December  Full name of the month
   MMMMM  D  Narrow name of the month

   ## Day
   d  14  The day of the month. A single d will use 1 for January 1st.
   dd  14  The day of the month. A double d will use 01 for January 1st.
   F  3rd Tuesday in December  The day of week in the month
   E  Tues  The day of week in the month
   EEEE  Tuesday  The full name of the day
   EEEEE  T  The narrow day of week

   ## Hour
   h  4  The 12-hour hour.
   hh  04  The 12-hour hour padding with a zero if there is only 1 digit
   H  16  The 24-hour hour.
   HH  16  The 24-hour hour padding with a zero if there is only 1 digit.
   a  PM  AM / PM for 12-hour time formats

   ## Minute
   m  35  The minute, with no padding for zeroes.
   mm  35  The minute with zero padding.

   ## Second
   s  8  The seconds, with no padding for zeroes.
   ss  08  The seconds with zero padding.

   ## Time Zone
   zzz  CST  The 3 letter name of the time zone. Falls back to GMT-08:00 (hour offset) if the name is not known.
   zzzz  Central Standard Time  The expanded time zone name, falls back to GMT-08:00 (hour offset) if name is not known.
   zzzz  CST-06:00  Time zone with abbreviation and offset
   Z  -0600  RFC 822 GMT format. Can also match a literal Z for Zulu (UTC) time.
   ZZZZZ  -06:00  ISO 8601 time zone format

   [online check](http://www.sdfonlinetester.info/#)
   */
  enum DateStringRepresentation: String, CaseIterable {

    /// ISO 8601 Data elements and interchange formats –
    /// Information interchange – Representation of dates and times
    /// is an international standard covering the exchange of date-
    /// and time-related data. It was issued by the International
    /// Organization for Standardization (ISO) and
    ///  was first published in 1988.
    ///
    /// [wiki link](https://en.wikipedia.org/wiki/ISO_8601)
    ///
    /// ### Sample
    ///
    ///       2001-01-01T01:01:01.000001+00:00
    case iso8601Full = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSz"

    /// 06:59.AM 12-03-2020
    case dot_hhmma_dash_ddMMyyyy = "hh:mm.a dd-MM-yyyy"

    /// 12:59
    case HHmm = "HH:mm"

    /// 07:16 AM
    case hhMMa = "hh:mm a"

    /// 07:18:03
    case HHmmss = "HH:mm:ss"

    /// 2020-03-12
    case yyyyMMdd = "yyyy-MM-dd"

    /// 2020-03
    case yyyyMM = "yyyy-MM"

    /// 2020-03-12 07:23:16
    case yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss"

    /// 12-March
    case ddMM = "dd-MMMM"

    /// 12-03-2020
    case ddMMyyyy = "dd-MM-yyyy"

    /// 12 March, 2020
    case ddMMMMyyyy = "dd MMMM, yyyy"

    /// 12-March-2020-Thursday
    case ddMMMMyyyyEEEE = "dd-MMMM-yyyy-EEEE"

    /// 12/03/2020
    case dd_slash_MM_slash_yyyy = "dd/MM/yyyy"

    /// 12, March
    case ddMMMM = "d, MMMM"

    /// March 12
    case MMMMd = "MMMM d"

    /// March
    case MMMM = "MMMM"

    /// March, 2020
    case MMMMyyyy = "MMMM, yyyy"

    /// Thursday - Mar 12
    case EEEEMMMd = "EEEE - MMM d"

    /// Thursday Mar 12
    case EEEEMMMdd = "EEEE MMM dd"

    /// Thursday, 03/12/2020
    case EEEEMMddyyyy = "EEEE, MM/dd/yyyy"

    /// Thursday, 12/03/2020
    case EEEEddMMyyyy = "EEEE, dd/MM/yyyy"

    /// Thursday, March 12, 2020 - 07:46
    case EEEEMMMMddyyyyhhmm = "EEEE, MMMM dd, yyyy - HH:mm"

    /// Thursday, 12/3, 07:47 AM
    case EEEEddMHHmma = "EEEE, dd/M, HH:mm a"

    /// Thursday, 12/3
    case EEEEddMM = "EEEE, dd/M"

    /// Thursday
    case EEEE = "EEEE"
  }

  func toString(_ format: DateStringRepresentation) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format.rawValue
    dateFormatter.calendar = Calendar(identifier: .gregorian)

    let stringRepresentation = dateFormatter.string(from: self)
    return stringRepresentation
  }
}

extension String {

  func toDate(format: Date.DateStringRepresentation) -> Date? {

    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = TimeZone.autoupdatingCurrent
    dateFormatter.dateFormat = format.rawValue
    return dateFormatter.date(from: self)
  }
}

public extension Date {

  /// Return date from components
  ///
  /// UNSAFE - check bounds
  ///
  static func dateFrom(day: Int, month: Int, year: Int) -> Date? {
    let dateString = "\(year)-\(month)-\(day)"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let targetDate = dateFormatter.date(from: dateString)
    return targetDate
  }
}
