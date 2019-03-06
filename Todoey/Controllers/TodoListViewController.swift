//
//  ViewController.swift
//  Todoey
//
//  Created by Akash Agrawal on 04/03/19.
//  Copyright © 2019 Akash Agrawal. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    let defaults = UserDefaults.standard
    let ITEMS_DEFAULTS_KEY = "TodoItemArray"
    var itemArray = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let items = defaults.array(forKey: ITEMS_DEFAULTS_KEY) as? [Item] {
            itemArray = items
        }
    }

    // MARK: Tableview Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        return cell
    }

    // MARK: TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done

        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: Add new items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()

        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // this will happen when user clicks on Add Item button in alert
            guard let newTodoText = textField.text else { return }
            let newItem = Item()
            newItem.title = newTodoText
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: self.ITEMS_DEFAULTS_KEY)
            self.tableView.reloadData()
        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

