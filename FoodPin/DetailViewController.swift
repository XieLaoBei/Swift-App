//
//  DetailViewController.swift
//  FoodPin
//
//  Created by LaoBei Xie on 17/01/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var restaurantImageView: UIImageView!
    var restaurantImage: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Display the selected restaurant image.
        self.restaurantImageView.image = UIImage(named: restaurantImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
