//
//  EventsTableViewController.swift
//  EventsFB
//
//  Created by Diego Cárcamo on 01/08/20.
//  Copyright © 2020 Diego Cárcamo. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController, EventViewDelegate {
    private let eventPresenter = EventPresenter(eventService: EventService())
    private var agenda: [Agenda] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventPresenter.setViewDelegate(eventViewDelegate: self)
        eventPresenter.getAgenda()
    }
    
    func showAgenda(agenda: [Agenda]) {
        self.agenda = agenda
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.agenda.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.agenda[section].events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventTableViewCell
        let event = self.agenda[indexPath.section].events[indexPath.row]
        
        cell.titleLabel.text = event.title
        cell.timeLabel.text = "\(event.startTime) – \(event.endTime)"
        cell.warningLabel.isHidden = !self.agenda[indexPath.section].eventOverlaps(event: event)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.agenda[section].dateString
    }
}
