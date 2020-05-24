//
//  AddItemViewController.swift
//  todolist
//
//  Created by tam nguyen on 5/24/20.
//  Copyright © 2020 tam nguyen. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: - Actions
    @IBAction func cancel()
    {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func done()
    {
        dismiss(animated: true, completion: nil)
    }
   
    // MARK:- Table View Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

}
