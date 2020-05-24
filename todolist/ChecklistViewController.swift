//
//  ViewController.swift
//  todolist
//
//  Created by tam nguyen on 5/23/20.
//  Copyright © 2020 tam nguyen. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    // Items
    var items = [ChecklistItem]()
    // Item
    let row0text = "Ly xem phim"
    let row1text = "Ly di ngu"
    let row2text = "Ly di choi"
    let row3text = "Ly luot facebook"
    let row4text = "Ly nau com cho anh ti"
    
    var row0checked = false
    var row1checked = false
    var row2checked = false
    var row3checked = false
    var row4checked = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let item1 = ChecklistItem()
        createItem(item: item1, name: "Ly xem phim", check: false)
        let item2 = ChecklistItem()
        createItem(item: item2, name: "Ly di ngu", check: true)
        let item3 = ChecklistItem()
        createItem(item: item3, name: "Ly di choi", check: true)
        let item4 = ChecklistItem()
        createItem(item: item4, name: "Ly luot facebook", check: true)
        let item5 = ChecklistItem()
        createItem(item: item5, name: "Ly nau com cho anh ti", check: false)
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    func createItem(item: ChecklistItem, name: String, check: Bool) {
        item.text = name
        item.checked = check
        items.append(item)
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    // Action
    @IBAction func addItem() {
        let newRowIndex = items.count
        let item = ChecklistItem()
        createItem(item: item, name: "Ly khong lam chi het", check: false)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    // Tableview Data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43.5
    }
    // Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.checked = !item.checked
            
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }

}

