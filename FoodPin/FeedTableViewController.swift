//
//  FeedTableViewController.swift
//  FoodPin
//
//  Created by LaoBeiXie on 27/02/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import UIKit
import CloudKit

class FeedTableViewController: UITableViewController {
    
    var restaurants:[CKRecord] = []
    
    func getRecordsFromCloud() {
        //Fetch data using Convenience API
        _ = CKContainer.default()
        let pubilcDatabase = CKContainer.default().publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        pubilcDatabase.perform(query, inZoneWith: nil, completionHandler: {
            results, error in
            if error == nil {
                print("Completed the download of Restaurant data")
                
                self.restaurants = results! as [CKRecord]
                
                // add the reloadDdate to main Thread !
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            } else {
                print(error!)
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getRecordsFromCloud()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        // #warning Incomplete implementation, return the number of sections
    }
    
  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
    // Contigure the cell
        let restaurant = restaurants[indexPath.row]
        cell.textLabel?.text = restaurant.object(forKey: "name") as? String
        if (restaurant.object(forKey: "image") != nil) {
            let imageAsset = restaurant.object(forKey: "image") as! CKAsset
            cell.imageView?.image = UIImage(data: NSData(contentsOf: imageAsset.fileURL)! as Data)
        }
        return cell
        
    }
}
