//
//  RestaurantTableTableViewController.swift
//  FoodPin
//
//  Created by LaoBeiXie on 08/01/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "ForKee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurantNames.count
    }
    
    
// very important !!!
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! CustomTableViewCell
        
        
        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: restaurantImages[indexPath.row])
        
        // Create CornerRadius
//        cell.thumbnailImageView?.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView?.layer.cornerRadius = 10.0
        cell.thumbnailImageView.clipsToBounds = true
        
        return cell
    }
    
/*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

 // Create the title label on the Alert Message above,difine optionMenu
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
 // Create the cancel Alert Action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil); optionMenu.addAction(cancelAction)
 // difine the action when optionMenu be pressed
        self.present(optionMenu, animated: true, completion: nil)
        
 // First Meet Closure !! Start
        let callActionHandler = {(action: UIAlertAction!) -> Void in
            
        let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, The Call feature is not available yet, Plaese retry later", preferredStyle: .alert)
            
        alertMessage.addAction(UIAlertAction(title: "OK!", style: .default, handler: nil))
            
        self.present(alertMessage, animated: true, completion: nil)
    }
 // Closure complate !
        
        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row)", style: UIAlertActionStyle.default, handler: callActionHandler)
        
        optionMenu.addAction(callAction)

 // Create isVisitedAction
        let isVisitedAction = UIAlertAction(title: "I' ve been here", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
        })
        optionMenu.addAction(isVisitedAction)
        
        // Change the color back immediately when the Animated over
        tableView.deselectRow(at: indexPath, animated: true)
 //        tableView.deselectRow(at: indexPath, animated: false)
}
*/
    // Display remove in Row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt IndexPath: IndexPath) {
    // Delete All about the deleted Row
        if editingStyle == .delete {
            self.restaurantNames.remove(at: IndexPath.row)
            self.restaurantLocations.remove(at: IndexPath.row)
            self.restaurantTypes.remove(at: IndexPath.row)
            self.restaurantImages.remove(at: IndexPath.row)
        }
        /*
        print("Total item: \(self.restaurantNames.count)")
        for name in restaurantNames {
            print(name)
        }
        */
        // Reload and refresh the tableVeiw
            self.tableView.deleteRows(at: [IndexPath], with: .fade)
    }
    
    
    // add editActionForRowAtIndexPath(Optional)
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: {(action: UITableViewRowAction, indexPath: IndexPath) -> Void in
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .actionSheet)
            let twitterAction = UIAlertAction(title: "Twitter", style: UIAlertActionStyle.default, handler: nil)
            let facebookAction = UIAlertAction(title: "FaceBook", style: UIAlertActionStyle.default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: UIAlertActionStyle.default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            
            self.present(shareMenu, animated:true, completion: nil)
        }
    )
    
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete", handler: {(action: UITableViewRowAction, indexPath: IndexPath) -> Void in
    
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)

            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    )
        // How to change the color of Action button text ?
        shareAction.backgroundColor = UIColor(red: 0.25, green: 0.75, blue: 1.00, alpha: 1.00)
        deleteAction.backgroundColor = UIColor(red: 0.74, green: 2.42, blue: 1.61, alpha: 1.00)
        
        
    return [deleteAction, shareAction]
}



    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
