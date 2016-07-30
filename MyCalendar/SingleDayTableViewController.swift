//
//  SingleDayTableViewController.swift
//  MyCalendar
//
//  Created by Ji Wang on 7/29/16.
//  Copyright © 2016 com.jiwang. All rights reserved.
//

import Foundation
import UIKit

class SingleDayTableViewController : UITableViewController {
	var events : [String] = Array()
	var monthNumber = -1
	var dayNumber = -1
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	override func tableView (tableView : UITableView, numberOfRowsInSection section: Int) -> Int {
		return events.count
	}
	
	@IBAction func addButtonPressed (sender :
	 UIBarButtonItem) {
		let  newEvent = "Test Event \(events.count+1)"
		events.append(newEvent)
		tableView.reloadData()
	}
	override func viewDidLoad() {
      print ("\(monthNumber)-\(dayNumber)")
	}
	
	override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		return true
	}
	
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if (editingStyle == UITableViewCellEditingStyle.Delete){
			events.removeAtIndex(indexPath.row)
			let sections = NSIndexSet(index: 0)
			tableView.reloadSections(sections,
			                         withRowAnimation: .Fade)
		}
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Basic")!
		cell.textLabel?.text = events[indexPath.row]
		return cell
	}

}