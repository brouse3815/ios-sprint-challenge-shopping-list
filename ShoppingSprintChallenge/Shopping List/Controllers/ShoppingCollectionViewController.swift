//
//  ShoppingCollectionViewController.swift
//  Shopping List
//
//  Created by Brian Rouse on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingCollectionViewController: UICollectionViewController {
    var shoppingManager = ShoppingManager()
      
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            shoppingManager = ShoppingManager()
            shoppingManager.loadFromPersistentStore()
            collectionView?.reloadData()
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        // MARK: UICollectionViewDataSource
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return shoppingManager.shoppingList.count
        }

        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! ShoppingCell
            let shoppingItem = shoppingManager.shoppingList[indexPath.item]
            cell.shoppingItem = shoppingItem
            
            return cell
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "DetailSegue" {
                let detailVC = segue.destination as! ShoppingDetailViewController
                detailVC.shoppingMgr = self.shoppingManager
            }
        }
        
        //
        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            shoppingManager.updateStatus(item: shoppingManager.shoppingList[indexPath.item])
            collectionView.reloadData()
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: ((collectionView.frame.size.width - 20) / 2), height: 130.0)
    }
}
