//
//  AllListsViewController.swift
//  todolist
//
//  Created by tam nguyen on 5/31/20.
//  Copyright © 2020 tam nguyen. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController {
    var lists = [Checklist]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add place holder data
        var list = Checklist(name: "Monday, June 1st")
        lists.append(list)
        
        list = Checklist(name: "Tuesday, June 2nd")
        lists.append(list)
        
        list = Checklist(name: "Wednesday, June 3rd")
        lists.append(list)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist" {
            let controller = segue.destination as! ChecklistViewController
            controller.checklist = sender as? Checklist
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lists.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistCell", for: indexPath)
        let checklist = lists[indexPath.row]
        cell.textLabel!.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
    
    // MARK:- Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let checklist = lists[indexPath.row]
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }
   
}
