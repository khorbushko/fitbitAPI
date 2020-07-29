//
//  HTTPEncoding.swift
//  fibi
//
//  Created by Kyryl Horbushko on 29.07.2020.
//  Copyright © 2020 Kyryl Horbushko. All rights reserved.
//

import Foundation

/// Form content types
///
/// https://www.w3.org/TR/html401/interact/forms.html#h-17.13.4
enum HTTPEncoding {

  /// Default
  ///
  /// This is the default content type. Forms submitted with this content type must be encoded as follows:
  ///
  /// Control names and values are escaped. Space characters are replaced by `+', and then reserved characters are escaped as described in [RFC1738], section 2.2: Non-alphanumeric characters are replaced by `%HH', a percent sign and two hexadecimal digits representing the ASCII code of the character. Line breaks are represented as "CR LF" pairs (i.e., `%0D%0A').
  ///
  /// The control names/values are listed in the order they appear in the document. The name is separated from the value by `=' and name/value pairs are separated from each other by `&'.
  public static let urlEncoded = "application/x-www-form-urlencoded"
  
  /// Data
  ///
  /// Each part is expected to contain:
  ///
  /// a "Content-Disposition" header whose value is "form-data".
  ///
  /// a name attribute specifying the control name of the corresponding control. Control names originally encoded in non-ASCII character sets may be encoded using the method outlined in [RFC2045].
  public static let multipart = "multipart/form-data"

  /// text
  ///
  /// introduced by HTML 5 and is useful only for debugging — from [the spec](http://www.w3.org/TR/html5/forms.html#text/plain-encoding-algorithm:) They are not reliably interpretable by computer — and I'd argue that the others combined with tools (like the Net tab in the developer tools of most browsers) are better for that).
  public static let text = "text/plain"

  /// JSON
  ///
  /// # ABANDONED
  ///
  /// [ref](https://www.w3.org/TR/html-json-forms/)
  public static let json = "application/json"
}

