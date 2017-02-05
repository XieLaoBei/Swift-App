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
//    @IBAction func showMap(segue: UITapGestureRecognizer) {
//        print("3453434")
//    }
/*2017-02-05 15:43:49.673494 FoodPin[1627:863167] [Warning] WARNING: A Gesture recognizer (<UITapGestureRecognizer: 0x1668b060; state = Possible; view = <UILabel 0x166df550>; target= <(action=perform:, target=<UIStoryboardShowSegueTemplate 0x16694610>)>>) was setup in a storyboard/xib to be added to more than one view (-><UILabel: 0x166e35c0; frame = (126 8; 270 27); text = 'Value'; opaque = NO; autoresize = RM+BM; userInteractionEnabled = NO; gestureRecognizers = <NSArray: 0x166e4fe0>; layer = <_UILabelLayer: 0x166e3710>>) at a time, this was never allowed, and is now enforced. Beginning with iOS 9.0 it will be put in the first view it is loaded into.
 

 */
    @IBAction func showMap(_ sender: Any) {
        print("3453434")
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
        
        //cell.mapButton.isHidden = true
        
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
            //cell.mapButton.isHidden = false
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
    
    // Tap Label(Cell) trans to other Controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 2 {
            self.performSegue(withIdentifier: "showMap", sender: self)
        }
        return
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

    // segue to MapViewController

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationController = segue.destination as! MapViewController
            destinationController.restaurant = restaurant
        }
    }
    
//    override func view
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
