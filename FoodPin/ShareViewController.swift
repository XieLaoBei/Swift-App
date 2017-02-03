//
//  ShareViewController.swift
//  FoodPin
//
//  Created by LaoBeiXie on 04/02/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define the background to blur
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // Move the buttons off screen (top)
        let translateUp = CGAffineTransform(translationX:0, y:-1000)
        twitterButton.transform = translateUp
        emailButton.transform = translateUp
        
        // Move the buttons off screen (down)
        let translateDown = CGAffineTransform(translationX:0, y:500)
        facebookButton.transform = translateDown
        messageButton.transform = translateDown
}

    // Animation Appear Detali
    override func viewDidAppear(_ animated: Bool) {
        
        let translate = CGAffineTransform(translationX:0, y:0)
        facebookButton.isHidden = false
        twitterButton.isHidden = false
        messageButton.isHidden = false
        emailButton.isHidden = false
        
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            self.facebookButton.transform = translate
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.8, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            self.messageButton.transform = translate
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.8, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            self.twitterButton.transform = translate
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            self.emailButton.transform = translate
        }, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
    

    

}
