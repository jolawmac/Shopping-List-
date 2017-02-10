//
//  ShoppingListController.swift
//  ShoppingList
//
//  Created by Josh & Erica on 2/10/17.
//  Copyright © 2017 Josh McDonald. All rights reserved.
//

import Foundation
import CoreData


class ShoppingListController {
    
    
    // Properties

    
    static let sharedController = ShoppingListController()
    
    // CRUD: 
    
    
    // Create: 
    
    func addToListWith(item: String) {
        
        let _ = ShoppingList(item: item)
        saveToPersistentStore()
        
    }
    
    // Read 
    
    var shoppingListItems: [ShoppingList] {
        let request: NSFetchRequest<ShoppingList> = ShoppingList.fetchRequest()
        let moc = Stack.context
        do {
            return try moc.fetch(request)
        } catch  {
            return []
        }
    }
    
    
    // Update 
    
    func toggledBoughtItem(shoppingList: ShoppingList) {
        shoppingList.bought = !shoppingList.bought
        
        saveToPersistentStore()
    }
    
    
    // Delete
    
    func delete(items: ShoppingList) {
        let moc = Stack.context
        moc.delete(items)
        
        saveToPersistentStore()
    }
    
    
    // Save 
    
    func saveToPersistentStore() {
        let moc = Stack.context
        do {
            try moc.save()
        } catch  {
            
        }
    }
    
    
    
}
