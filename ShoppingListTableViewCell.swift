//
//  ShoppingListTableViewCell.swift
//  ShoppingList
//
//  Created by Josh & Erica on 2/10/17.
//  Copyright © 2017 Josh McDonald. All rights reserved.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    // Delegate var
    
    weak var delegate: ShoppingListTableViewCellDelegate?
    
    // Outlets:
    
    @IBOutlet weak var shoppingListText: UILabel!
    @IBOutlet weak var checkboxButton: UIButton!
    
    var shoppingList: ShoppingList? {
        didSet {
            updateViews()
        }
    }
    
    // Actions:
    
    @IBAction func checkboxTapped(_ sender: Any) {
        delegate?.shoppingListButtonTapped(sender: self)
    }
    
    
    // Update 
    
    func updateViews() {
        guard let shoppingList = shoppingList else { shoppingListText.text = ""; return }
        shoppingListText.text = shoppingList.item
        let image = shoppingList.bought ? #imageLiteral(resourceName: "complete"): #imageLiteral(resourceName: "incomplete")
        checkboxButton.setImage(image, for: .normal)
        
    }
    
    
}


// Protocol


protocol ShoppingListTableViewCellDelegate: class {
    func shoppingListButtonTapped(sender: ShoppingListTableViewCell)
    
}




