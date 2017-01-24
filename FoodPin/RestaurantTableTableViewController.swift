//
//  RestaurantTableTableViewController.swift
//  FoodPin
//
//  Created by LaoBeiXie on 08/01/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurants.count
    }

    /*
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong",
                   image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei.jpg",
                   isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image:
            "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong",
                   image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image:
            "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image:
            "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image:
            "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image:
            "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image:
            "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney",
                   image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image:
            "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif.jpg",
                   isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "NewYork",
                   image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image:
                "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image:
                "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image:
                "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image:
                "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image:
                "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image:
                "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image:
                "royaloak.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "Thai", location: "London", image: "thaicafe.jpg",
                       isVisited: false)
    ]
    */
    
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po HingFong, Sheung Wan, Hong Kong", image: "cafedeadend.jpg", isVisited: true),
        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping SanStreet SOHO, Sheung Wan, Hong Kong", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan RoadSOHO, Sheung Wan, Hong Kong", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shop B, 20Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan RoadSOHO, Sheung Wan, Hong Kong", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Shop J-K., 200Hollywood Road, SOHO, Sheung Wan, Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po Hing Fong,Sheung Wan, Hong Kong", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke StSydney New South Wales 2010 Surry Hills", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St SydneyNew South Wales", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Shop 1 61York St Sydney New South Wales", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY10003", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY11211", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445Graham Ave Brooklyn, NY 11211", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham AveBrooklyn, NY 11211", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford AveBrooklyn, NY 11222", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4thAve Brooklyn, NY 11220", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY10003", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "54 Frith Street London W1D4SL United Kingdom", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H7ND United Kingdom", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P4BZ United Kingdom", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "Thai", location: "22 Charlwood Street London SW1V2DY Pimlico", image: "thaicafe.jpg", isVisited: false)
    ]
    
    
    var restaurantIsVisited = [Bool](repeating: false, count: 21)
    
// very important !!!
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! CustomTableViewCell
        
        let restaurant = restaurants[indexPath.row]
//        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.nameLabel?.text = restaurant.name
        cell.thumbnailImageView?.image = UIImage(named: restaurant.image)
        cell.locationLabel?.text = restaurant.location
        cell.typeLabel.text = restaurant.type
//        cell.favorIconImageView.hidden = !restaurant.isVisited
        
        
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
            /*
            self.restaurantNames.remove(at: IndexPath.row)
            self.restaurantLocations.remove(at: IndexPath.row)
            self.restaurantTypes.remove(at: IndexPath.row)
            self.restaurantImages.remove(at: IndexPath.row)
            */
            self.restaurants.remove(at: IndexPath.row)
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
            /*
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            */
            self.restaurants.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    )
        // How to change the color of Action button text ?
        shareAction.backgroundColor = UIColor(red: 0.25, green: 0.75, blue: 1.00, alpha: 1.00)
        deleteAction.backgroundColor = UIColor(red: 0.74, green: 2.42, blue: 1.61, alpha: 1.00)
        
        
    return [deleteAction, shareAction]
}


    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "showRestaurantDetail" {
            if let IndexPath = self.tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: IndexPath, animated: true)

                let destinationController = segue.destination as! DetailViewController
//                destinationController.restaurantImage = self.restaurants[IndexPath.row].image
                  destinationController.restaurant = restaurants[IndexPath.row]
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Remove the Navigation Bar Title Text in DetailViewController
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        navigationController?.hidesBarsOnSwipe = true
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
