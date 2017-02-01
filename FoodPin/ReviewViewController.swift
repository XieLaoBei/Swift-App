//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by LaoBeiXie on 01/02/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var dialogView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // add BlurEffect to ReviewView
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // combining two Transforms
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let translate = CGAffineTransform(translationX: 0, y: 500)
        // OLD--- dialogView.transform = CGAffineTransformConcat(scale, translate)
        dialogView.transform = scale.concatenating(translate)
        
        // add Animation to dialogView(Plan A + Plan B)
//      dialogView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        // Plan C
//        dialogView.transform = CGAffineTransform(translationX: 0, y: 500)
    }
    /*
    override func viewDidAppear(_ animated: Bool) {
        // Plan A
//        UIView.animate(withDuration: 0.7, delay: 0.0, options: [], animations: {self.dialogView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)}, completion: nil)
        // Plan B(Spring Animation)
//        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {self.dialogView.transform = CGAffineTransform(scaleX: 1, y: 1) }, completion: nil)
    }
    */
    
    /*
    // Plan C( Slide up Animation)
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {self.dialogView.transform = CGAffineTransform(translationX:0, y: 0)}, completion: nil)
    }
    */
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {
            let scale = CGAffineTransform(scaleX: 1.0, y: 1.0)
            let translate = CGAffineTransform(translationX: 0, y: 0)
            self.dialogView.transform = scale.concatenating(translate)}, completion: nil)
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
