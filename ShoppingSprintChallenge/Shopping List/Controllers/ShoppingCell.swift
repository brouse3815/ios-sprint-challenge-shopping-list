//
//  ShoppingCell.swift
//  Shopping List
//
//  Created by Brian Rouse on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCell: UICollectionViewCell {
    
 @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var shoppingImageView: UIImageView!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        shoppingImageView.image = UIImage(named: shoppingItem.imageName)
        shoppingItemLabel.text = shoppingItem.itemName
        if shoppingItem.hasBeenAdded == false {
            statusLabel.text = "Not added"
        } else if shoppingItem.hasBeenAdded == true {
            statusLabel.text = "Added"
        }
    }
    
}



