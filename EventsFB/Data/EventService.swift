//
//  EventService.swift
//  EventsFB
//
//  Created by Diego Cárcamo on 01/08/20.
//  Copyright © 2020 Diego Cárcamo. All rights reserved.
//

import Foundation

class EventService {
    func getEvents() -> [Event] {
        if let path = Bundle.main.path(forResource: "mock", ofType: "json") {
            if let jsonData = try? NSData(contentsOfFile: path, options: .dataReadingMapped) {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(.fbDate)

                do {
                    let events = try decoder.decode([Event].self, from: jsonData as Data)
                    return events;
                } catch {
                    return []
                }
            }
        }
        
        return []
    }
}
