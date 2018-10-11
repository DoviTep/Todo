//
//  ViewController.swift
//  Todo
//
//  Created by Admin on 2018/10/11.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    let itemArray = ["Find Mike", "buy Eggs", "Destroy Non Payment"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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

}

