//
//  Stack.swift
//  ShoppingList
//
//  Created by Josh & Erica on 2/10/17.
//  Copyright © 2017 Josh McDonald. All rights reserved.
//

import Foundation
import CoreData

class Stack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "ShoppingList")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
}
