//
//  PageContentViewController.swift
//  FoodPin
//
//  Created by LaoBeiXie on 21/02/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var subHeadingLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var getStartedButton: UIButton!
//    @IBOutlet weak var forwardButton: UIButton!
    
    // Add Action Methods for the getStartedButton & forwardButton
    @IBAction func close(_ sender: Any) {
        // Store the status of walkthrough has gone...
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "hasViewedWalkthrough")
        
        dismiss(animated: true, completion: nil)
    }
    
//    @IBAction func nextScreen(sender: Any) {
//        let pageViewController = self.parent as! PageViewController
//        pageViewController.forward(index: index)
//    }
    
    var index : Int = 0
    var heading : String = ""
    var imageFile : String = ""
    var subHeading : String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        headingLabel.text = heading
        subHeadingLabel.text = subHeading
        contentImageView.image = UIImage(named: imageFile)
        
        // Add Custom Page indicator
        pageControl.currentPage = index
        
        // Add getStarted & forwoad button
        getStartedButton.isHidden = (index == 2) ? false : true
//        forwardButton.isHidden = (index == 2) ? true : false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
