//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Josh & Erica on 2/10/17.
//  Copyright © 2017 Josh McDonald. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController, ShoppingListTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Alert Controller & Action for Plus Button 
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Add an item:", message: "Enter the item you want to add to your list below:", preferredStyle: .alert)
        
        var itemTextField: UITextField?
        
        alertController.addTextField { (textfield) in
            itemTextField = textfield
            
            let submitAction = UIAlertAction(title: "Submit", style: .default) { (_) in
                guard let item = itemTextField?.text else { return }
                ShoppingListController.sharedController.addToListWith(item: item)
                
                self.tableView.reloadData()
                
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertController.addAction(submitAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        
    }
    }
    
        func shoppingListButtonTapped(sender: ShoppingListTableViewCell) {
            guard let item = sender.shoppingList, let indexPath = tableView.indexPath(for: sender) else { return }
            ShoppingListController.sharedController.toggledBoughtItem(shoppingList: item)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
    


    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return ShoppingListController.sharedController.shoppingListItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as? ShoppingListTableViewCell else { return UITableViewCell() }

        let item = ShoppingListController.sharedController.shoppingListItems[indexPath.row]
        cell.shoppingList = item
        cell.delegate = self
        

        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let item = ShoppingListController.sharedController.shoppingListItems[indexPath.row]
            ShoppingListController.sharedController.delete(items: item)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
}
