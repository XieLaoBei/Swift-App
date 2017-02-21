//
//  RestaurantTableTableViewController.swift
//  FoodPin
//
//  Created by LaoBeiXie on 08/01/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController, UISearchResultsUpdating {
    
    @IBAction func unwindToHomeScreen (segue: UIStoryboardSegue) {
        
    }
    
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

    // Add SearchBar using UISearchController
    var searchController: UISearchController!
    var searchResults:[Restaurant] = []
    
    func filterContentForSearchText(searchText: String) {
          searchResults = restaurants.filter({( restaurant: Restaurant) -> Bool in
            let nameMatch = restaurant.name.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return nameMatch != nil
        })
   }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        
        filterContentForSearchText(searchText: searchText!)
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        if searchController.isActive {
            return searchResults.count
        } else {
        return self.restaurants.count
    }
}

    
        
    
    var restaurantIsVisited = [Bool](repeating: false, count: 21)
    
// very important !!!
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! CustomTableViewCell
        
        let restaurant = (searchController.isActive) ? searchResults[indexPath.row] : restaurants[indexPath.row]

        cell.nameLabel?.text = restaurant.name
        cell.thumbnailImageView?.image = UIImage(named: restaurant.image)
        cell.locationLabel?.text = restaurant.location
        cell.typeLabel.text = restaurant.type

        
        
        // Create CornerRadius
//        cell.thumbnailImageView?.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView?.layer.cornerRadius = 10.0
        cell.thumbnailImageView.clipsToBounds = true
        
        return cell
    }
    
    // Display remove in Row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt IndexPath: IndexPath) {
    // Delete All about the deleted Row
        if editingStyle == .delete {
            
            self.restaurants.remove(at: IndexPath.row)
        }
        
        // Reload and refresh the tableVeiw
            self.tableView.deleteRows(at: [IndexPath], with: .fade)
    
    
    // indecate the cell is non-editable when the search controller is active
    func tableView(_ tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
            if searchController.isActive {
                return false
            } else {
                return true
            }
        }
        
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
                destinationController.restaurant = (searchController.isActive) ? searchResults[IndexPath.row] : restaurants[IndexPath.row]
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
        
        // Add SearchBar
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
        
        // Add Search ResultsUpdating
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
       

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
