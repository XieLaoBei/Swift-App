//
//  AppDelegate.swift
//  FoodPin
//
//  Created by LaoBeiXie on 08/01/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Customizing the Appearance of Navigation Bar Color
        UINavigationBar.appearance().barTintColor = UIColor(red: 231.0/255.0, green: 95.0/255.0, blue: 53.0/255.0, alpha: 0.3)
        // Customizing the Appearance of Navigation Bar Text Color
        UINavigationBar.appearance().tintColor = UIColor.white
        // Customizing the Appearance of Navigation Bar Tint Color
        if let barFont = UIFont(name: "AvenirNextCondensed-DemiBold", size: 22.0) {
            UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName:barFont]
       }
        UIApplication.shared.statusBarStyle = .lightContent
        // Override point for customization after application launch.
        
        //UIBarButtonItem.appearance().tintColor = UIColor(red:235.0/255.0, green: 73.0/255.0, blue: 27.0/255.0, alpha: 1.0)
        UIToolbar.appearance().barTintColor = UIColor(red: 237.0/255.0, green: 240.0/255.0, blue: 243.0/255.0, alpha: 0.5)
        
        // Customizing the Appearance of The Tabbar and BarTint
        UITabBar.appearance().tintColor = UIColor(red: 235.0/255.0, green: 75.0/255.0, blue: 27.0/255.0, alpha: 1.0)
        UITabBar.appearance().barTintColor = UIColor.black
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
            }

    func applicationWillEnterForeground(_ application: UIApplication) {
       
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

