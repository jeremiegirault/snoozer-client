//
//  TaskViewController.swift
//  snoozer
//
//  Created by Jeremie Girault on 04/10/2016.
//
//

import UIKit
import SnoozerRPC
import MGSwipeTableCell

class CustomCell: MGSwipeTableCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup() {
        self.selectionStyle = .none
        self.detailTextLabel?.textColor = Colors.detail
        self.detailTextLabel?.font = Fonts.detail
    }
}

class TaskViewController: UITableViewController {
    
    var events: [SNZEvent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "task")
        tableView.rowHeight = 60
        
        let req = SNZNull()
        SNZSnoozer.shared.listEvents(withRequest: req) { [weak self] events, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                DispatchQueue.main.async {
                    let array = events?.eventsArray.flatMap { $0 as? SNZEvent }
                    self?.events = array ?? []
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    private func snooze(_ model: SNZEvent) {
        let foundIndex = events.index { $0.id_p == model.id_p }
        guard let index = foundIndex  else { return }
        
        let indexPath = IndexPath(row: index, section: 0)
        tableView.beginUpdates()
        events.remove(at: indexPath.row)
        tableView.deleteRows(at: [ indexPath ], with: .left)
        tableView.endUpdates()
        
        let req = SNZSwipeRequest()
        req.eventId = model.id_p
        SNZSnoozer.shared.swipeEvent(with: req) { [weak self] res, err in
            guard let uself = self else { return }
            
            //uself.toast(withTitle: "Event was snoozed to the next day") {
            //    print("Cancelled")
            //}
            
            if let err = err {
                print("Error \(err)")
            } else if let event = res?.event {
                let foundIndex = event.start.snoozeDate.flatMap { date in
                    return uself.events.index {
                        guard let itemDate = $0.start.snoozeDate else { return false }
                        return itemDate > date
                    }
                }
                print("\(model.start!) -> \(event.start!)")
                let finalIndex = foundIndex ?? uself.events.count
                let indexPath = IndexPath(row: finalIndex, section: 0)
                uself.tableView.beginUpdates()
                uself.events.insert(event, at: finalIndex)
                uself.tableView.insertRows(at: [ indexPath ], with: .automatic)
                uself.tableView.endUpdates()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "task", for: indexPath) as! MGSwipeTableCell
        let model = events[indexPath.row]
        let swipeButton = MGSwipeButton(title: "Sn👀ze", backgroundColor: Colors.snooze) { [weak self] _ in
            self?.snooze(model)
            return true
        }
        
        cell.rightButtons = [ swipeButton ]
        cell.rightExpansion.buttonIndex = 0
        cell.rightExpansion.fillOnTrigger = true
        //cell.rightExpansion.expansionLayout = .center
        cell.textLabel?.text = model.name
        if !model.allDay {
            let from = model.start.snoozeDate?.dateTimeString ?? "-"
            let to = model.end.snoozeDate?.dateTimeString ?? "-"
            cell.detailTextLabel?.text = "\(from) - \(to)"
        } else {
            let day = model.start.snoozeDate?.dateString ?? "-"
            cell.detailTextLabel?.text = "\(day)"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
}
