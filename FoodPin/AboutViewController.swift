//
//  AboutViewController.swift
//  FoodPin
//
//  Created by LaoBei Xie on 23/02/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import UIKit
import MessageUI

class AboutViewController: UIViewController, MFMailComposeViewControllerDelegate, UINavigationBarDelegate {
    
    @IBAction func sendEmail(sender: AnyObject) {
        if MFMailComposeViewController.canSendMail() {
            let composer = MFMailComposeViewController()
            
            composer.mailComposeDelegate = self
            composer.setToRecipients(["boringkiller@163.com"])
            composer.navigationBar.tintColor = UIColor.white
            
//            present(composer, animated: true, completion:nil)
//            self.navigationController?.presentedViewController(composer, animated: true, completion: nil)
            self.present(composer, animated: true, completion: nil)
        }
    }

    
    override var preferredStatusBarStyle: UIStatusBarStyle { get { return .lightContent}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // Add method for sending Email
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result.rawValue {
            
        case MFMailComposeResult.cancelled.rawValue:
            print("Mail cancelled")
            
        case MFMailComposeResult.saved.rawValue:
            print("Mail saved")
            
        case MFMailComposeResult.sent.rawValue:
            print("Mail sent")
            
        case MFMailComposeResult.failed.rawValue:
            print("Failed to send mail: \(error?.localizedDescription)")
            
        default:
            break
        }
        
        dismiss(animated: true, completion: nil)
    }
}
