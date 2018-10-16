//
//  ViewController.swift
//  Todo
//
//  Created by Admin on 2018/10/11.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    var itemArray = [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) .first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        print(dataFilePath)
      
      //  let newItem = Item()
      //      newItem.title = "Find Mike"
      //      itemArray.append(newItem)
        
    //    let newItem2 = Item()
    //     newItem2.title = "Buy Eggs"
    //    itemArray.append(newItem2)
        
    //    let newItem3 = Item()
    //    newItem3.title = "destroy eggs"
    //    itemArray.append(newItem3)
        
        loaditems()
        
        
        
  //      if let items = defaults.array(forKey: "TodoList") as? [Item] {
  //          itemArray = items
  //
  //      }
        
        
    }

        //MARK - TABLE VIEW SOURCES
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRowAtIndexpathcalled")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray [indexPath.row]
        
        cell.textLabel?.text = item.title
        
        
        
        return cell
 
    }
    
    // MARK TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
            
        
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }

        ///MArk Add New Items
    
    @IBAction func AddButton(_ sender: UIBarButtonItem) {
        
        var textfield = UITextField()
        
        
     let alert = UIAlertController(title: "Add New Item for Todey ", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style:  .default) { (action) in
            
        
        let newItem = Item ()
        newItem.title = textfield.text!
            
        self.itemArray.append(newItem)
            
         self.saveItems()
        
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textfield = alertTextField
            
            print(alertTextField)
    
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    func saveItems () {
        
        let encoder = PropertyListEncoder ()
        
        do{
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error )")
            
            
        }

        self.tableView.reloadData()
        
    }
    
    func loaditems () {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder ()
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding item array, \(error)")
            }
            
        }
        
        
        
              //if let data = try? Data(contentsOf: dataFilePath!){
               // let decoder = PropertyListDecoder()
            
            
        }
        
    }
    

