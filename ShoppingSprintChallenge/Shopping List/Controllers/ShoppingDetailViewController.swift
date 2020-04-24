//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Brian Rouse on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
   var shoppingMgr: ShoppingManager?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            displayInfo()
        }
        
        @IBAction func submitOrderButtonPressed(_ sender: Any) {
            shoppingAlert()
        }
       
        func shoppingAlert() {
            if shoppingMgr!.selectedItems.count != 0 {
            let alert = UIAlertController(title: "Submitted!", message: "Thanks \(nameTextField.text!)! The item(s) you have selected will be delivered to your address at \(addressTextField.text!) in 15 minutes.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Proceed", style: .default, handler: {_ in
                let alert = UIAlertController(title: "Thank you!", message: "You have successfully submitted your order.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Proceed", style: .default, handler: {_ in
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true)
            }))
            alert.addAction(UIAlertAction(title: "Undo", style: .default, handler: nil))
            self.present(alert, animated: true)
            }
        }
        
        
        func displayInfo() {
            if let numberOfItems = shoppingMgr?.selectedItems.count {
                messageLabel.text = "You currently have \(numberOfItems) item(s) in your shopping list."
            }
        }
    }
