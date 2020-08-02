//
//  Extensions.swift
//  EventsFB
//
//  Created by Diego Cárcamo on 01/08/20.
//  Copyright © 2020 Diego Cárcamo. All rights reserved.
//

import Foundation

extension DateFormatter {
  static let fbDate: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM d, yyyy h:mm a"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
    
    static let shortDate: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "MMMM d, yyyy"
      formatter.calendar = Calendar(identifier: .iso8601)
      formatter.timeZone = TimeZone(secondsFromGMT: 0)
      formatter.locale = Locale(identifier: "en_US_POSIX")
      return formatter
    }()
    
    static let shortTimeDate: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "h:mm a"
      formatter.calendar = Calendar(identifier: .iso8601)
      formatter.timeZone = TimeZone(secondsFromGMT: 0)
      formatter.locale = Locale(identifier: "en_US_POSIX")
      return formatter
    }()
}
