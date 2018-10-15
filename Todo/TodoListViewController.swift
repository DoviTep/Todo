//
//  ViewController.swift
//  Todo
//
//  Created by Admin on 2018/10/11.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    var itemArray = ["Find Mike", "buy Eggs", "no shampoo at Checkers"]
    
    let defaults = UserDefaults.standard
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "TodoList") as? [String] {
            
            itemArray = items
        
        }
        
        
    }

        //MARK - TABLE VIEW SOURCES
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
 
    }
    
    // MARK TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
    
        tableView.deselectRow(at: indexPath, animated: true)
    }

        ///MArk Add New Items
    
    @IBAction func AddButton(_ sender: UIBarButtonItem) {
        
        var textfield = UITextField()
        
        
     let alert = UIAlertController(title: "Add New Item for Todey ", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style:  .default) { (action) in
            
        self.itemArray.append(textfield.text!)
            
        self.defaults.set(self.itemArray, forKey: "TodoList")
        
            
        self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textfield = alertTextField
            
            print(alertTextField)
        
            
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
 
    }
}
