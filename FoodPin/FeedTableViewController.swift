//
//  FeedTableViewController.swift
//  FoodPin
//
//  Created by LaoBeiXie on 27/02/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import UIKit
import CloudKit


//MARK: - Life Cycle -
class FeedTableViewController: UITableViewController {

    var spinner: UIActivityIndicatorView? = nil
    var restaurants:[CKRecord] = []
    var imageCache: NSCache <CKRecordID, NSURL> = NSCache()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getRecordsFromCloud()
        
        // Pull to Refresh Control
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = UIColor.white
        refreshControl?.tintColor = UIColor.gray
        refreshControl?.addTarget(self, action: Selector(("getRecordsfromCloud")), for: UIControlEvents.valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - Table view data source

extension FeedTableViewController {
    
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
        
        if restaurants.isEmpty {
            return cell
        }
        
        // Contigure the cell
        let restaurant = restaurants[indexPath.row]
        cell.textLabel?.text = restaurant.object(forKey: "name") as? String
        
        // Set default image
        cell.imageView?.image = UIImage(named: "camera")
        
        // See if we can get the image from cache
        if let imageFileURL = imageCache.object(forKey: restaurant.recordID)  {
            print("Get the image from Cache")
            if let data = try? Data.init(contentsOf: imageFileURL as URL) {
                cell.imageView?.image = UIImage(data: data)
        }
        } else {
        
        // Fetch Image from Cloud in background
        let publicDatabase = CKContainer.default().publicCloudDatabase
        let fetchRecordImageOPeration = CKFetchRecordsOperation(recordIDs: [restaurant.recordID])
        fetchRecordImageOPeration.desiredKeys = ["image"]
        fetchRecordImageOPeration.queuePriority = .veryHigh
        fetchRecordImageOPeration.perRecordCompletionBlock = {(record: CKRecord?, recordID: CKRecordID?, error: Error?) -> Void in
            if (error != nil) {
             print("Failed to get restaurant image: \(error?.localizedDescription)")
            } else {
                if let restaurantRecord = record {
                    DispatchQueue.main.async {
                        let imageAsset = restaurantRecord.object(forKey: "image") as! CKAsset
                        
                        // Retrieve the Cached image for cell with recordID
                        self.imageCache.setObject(imageAsset.fileURL as NSURL, forKey: restaurant.recordID)
                        cell.imageView?.image = UIImage(data: NSData(contentsOf: imageAsset.fileURL)! as Data)
                    }
                }
            }
//        if (restaurant.object(forKey: "image") != nil) {
//            let imageAsset = restaurant.object(forKey: "image") as! CKAsset
//            cell.imageView?.image = UIImage(data: NSData(contentsOf: imageAsset.fileURL)! as Data)
        }
        publicDatabase.add(fetchRecordImageOPeration)

        }
        return cell
    }

}

// MARK: - Fetch Data
extension FeedTableViewController {
    // Add a Spinner to improve user experience when data loading
    func addSpinner() {
        spinner = UIActivityIndicatorView(frame: CGRect.init(x:0.0, y:0.0, width:50.0, height:50.0))
        let centerPoint = self.view.center
        let y = centerPoint.y - 268
        spinner?.center = CGPoint.init(x: centerPoint.x, y: y)
        spinner?.hidesWhenStopped = true
        spinner?.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(spinner!)
        spinner?.startAnimating()
//        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func getRecordsFromCloud() {
        /*
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
         
         // add the reloadData to main Thread !
         DispatchQueue.main.async(execute: {
         self.tableView.reloadData()
         })
         } else {
         print(error!)
         }
         })
         }
         */
        
        // Fatch data using Operational API
        // Initialize an empty restaurants array
        restaurants = []
        addSpinner()
        
        // Get the Public iCloud Database
        _ = CKContainer.default()
        let publicDatabase = CKContainer.default().publicCloudDatabase
        
        // Prepare the query
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        
        // Create the query operation with the query
        let queryOperation = CKQueryOperation(query: query)
        queryOperation.desiredKeys = ["name"]
        queryOperation.queuePriority = .veryHigh
        queryOperation.resultsLimit = 50
        queryOperation.recordFetchedBlock = {(record: CKRecord!) -> Void in
            if let restaurantRecord = record {
                self.restaurants.append(restaurantRecord)
            }
        }
        queryOperation.queryCompletionBlock = {(cursor: CKQueryCursor?, error: Error?) -> Void in
            if (error != nil) {
                print("Failed to get data from iCloud - \(error?.localizedDescription)")
                DispatchQueue.main.async(execute: {
                    self.spinner?.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                })
            } else {
                print("Successfully retrieve the data from iCloud")
                
                // add the reloadData to main Thread
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                    self.spinner?.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                })
            }
        }
        
        // Execute the query
        publicDatabase.add(queryOperation)
        
    }
}
