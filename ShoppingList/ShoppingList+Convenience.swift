//
//  ShoppingList+Convenience.swift
//  ShoppingList
//
//  Created by Josh & Erica on 2/10/17.
//  Copyright © 2017 Josh McDonald. All rights reserved.
//

import Foundation
import CoreData

extension ShoppingList {
    
    @discardableResult convenience init(item: String, bought: Bool = false, context: NSManagedObjectContext = Stack.context) {
        self.init(context: context)
        self.item = item
        self.bought = bought
    }
}
