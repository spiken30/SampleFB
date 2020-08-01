//
//  EventPresenter.swift
//  EventsFB
//
//  Created by Diego Cárcamo on 01/08/20.
//  Copyright © 2020 Diego Cárcamo. All rights reserved.
//

protocol EventViewDelegate: NSObjectProtocol {
    func showAgenda(agenda: [Agenda])
}

import Foundation

class EventPresenter {
    private let eventService: EventService
    weak private var eventViewDelegate : EventViewDelegate?
    
    init(eventService: EventService){
        self.eventService = eventService
    }
    
    func setViewDelegate(eventViewDelegate: EventViewDelegate?){
        self.eventViewDelegate = eventViewDelegate
    }
    
    func getAgenda() {
        let agenda = self.parseEventsToAgenda()
        self.eventViewDelegate?.showAgenda(agenda: agenda)
    }
    
    private func parseEventsToAgenda() -> [Agenda] {
        let events = self.eventService.getEvents()
        let empty: [Date: [Event]] = [:]
        let grouped = events.sorted(by: { $0.startTime < $1.startTime }).reduce(into: empty) { acc, cur in
            let components = Calendar.current.dateComponents([.year, .month, .day], from: cur.start)
            let date = Calendar.current.date(from: components)!
            let existing = acc[date] ?? []
            acc[date] = existing + [cur]
        }
        return grouped.map({ key, value in
            return Agenda(date: key, events: value)
        }).sorted(by: { $0.date < $1.date })
    }
}
