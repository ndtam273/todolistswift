//
//  AddItemViewController.swift
//  todolist
//
//  Created by tam nguyen on 5/24/20.
//  Copyright © 2020 tam nguyen. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
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
    
    // MARK:- TextField Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        print(oldText)
        let stringRange = Range(range, in: oldText)!
        print(stringRange)
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        print(newText)
        doneBarButton.isEnabled = !newText.isEmpty
        return true
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }

}
