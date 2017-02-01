//
//  DetailViewController.swift
//  FoodPin
//
//  Created by LaoBei Xie on 17/01/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func close(segue: UIStoryboardSegue) {
    }
    
    var restaurantImage: String!
    
    var restaurant: Restaurant!
    
    // Add canPerformUnwindSegueAction for close Button segue
    //override func  canPerformUnwindSegueAction(_ action: Selector, from fromViewController: UIViewController, withSender sender: Any) -> Bool {
      //  return true
    //}
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text = (restaurant.isVisited) ?  "Yes,I've been here before" : "No"
        default:
            cell.fieldLabel.text = ""
            cell.fieldLabel.text = ""
            
            cell.backgroundColor = UIColor.clear
        }
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Display the selected restaurant image.
        self.restaurantImageView.image = UIImage(named: restaurant.image)
        self.extendedLayoutIncludesOpaqueBars = false
        
        self.tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        
        self.tableView.tableFooterView = UIView(frame: CGRect())
        
        self.tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        title = self.restaurant.name
//        navigationController?.hidesBarsOnSwipe = false
        
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
