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
        /*
         
         - Algorithm to find conflicts across events
         
         Use filter array func to find if a given event has conflicts with another one
         
         This function is called for every cell that is rendered in the UI, instead for
         every item on the json data, so iteration can be used onlye when needed
         
         Also, data is segmented by day previously, so this function only iterates on
         that group of elements rather on all items on json data
         
         Linear Complexity O(n)
         
         */
        let overlapingEvents = self.events.filter({ evt in
            return (evt.start..<evt.end).overlaps(event.start..<event.end) && evt !== event
        }).count
        return overlapingEvents > 0
    }
}
