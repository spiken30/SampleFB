//
//  EventModel.swift
//  EventsFB
//
//  Created by Diego Cárcamo on 01/08/20.
//  Copyright © 2020 Diego Cárcamo. All rights reserved.
//

import Foundation

class Event: Codable {
    var title: String
    var start: Date
    var end: Date
    var overlaps: Bool?
    var date: String {
        return DateFormatter.shortDate.string(from: self.start)
    }
    var startTime: String {
        return DateFormatter.timeDate.string(from: self.start)
    }
    var endTime: String {
        return DateFormatter.timeDate.string(from: self.end)
    }
}
