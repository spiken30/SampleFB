//
//  AgendaModel.swift
//  EventsFB
//
//  Created by Diego Cárcamo on 01/08/20.
//  Copyright © 2020 Diego Cárcamo. All rights reserved.
//

import Foundation

struct Agenda {
    var date: Date
    var dateString: String {
        return DateFormatter.shortDate.string(from: date)
    }
    var events: [Event]
    
    func eventOverlaps(event: Event) -> Bool {
        let overlapingEvents = self.events.filter({ evt in
            let overlaps = (evt.start..<evt.end).overlaps(event.start..<event.end) && evt !== event
            event.overlaps = overlaps
            return overlaps
        }).count
        return overlapingEvents > 0
    }
}
