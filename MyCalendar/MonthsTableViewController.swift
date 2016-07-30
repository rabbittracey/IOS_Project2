//
//  MonthsTableViewController.swift
//  MyCalendar
//
//  Created by Ji Wang on 7/29/16.
//  Copyright © 2016 com.jiwang. All rights reserved.
//

import Foundation
import UIKit

class MonthsTableViewController : UITableViewController {
	let MonthSet = [
	"January", "Febrary", "March", "April","May","June","July","August",
	"September","October","November","December"
	]
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
	   return 1
	}
	override func tableView (tableView : UITableView, numberOfRowsInSection section: Int) -> Int {
		return MonthSet.count
	}
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
	  let cell = tableView.dequeueReusableCellWithIdentifier("Basic")!
		cell.textLabel?.text = MonthSet[indexPath.row]
		return cell
	}
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if (segue.identifier == "MonthSegue") {
			let selectedRow = tableView.indexPathForSelectedRow?.row
			if let dest = segue.destinationViewController as?
				DaysTableViewController {
				  dest.title = MonthSet[selectedRow!]
				   dest.MonthNumber = selectedRow!+1
			}
		}
	}
}
