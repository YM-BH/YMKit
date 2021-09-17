//
//  AppDelegate.swift
//  YMKit-Swift
//
//  Created by 白晗 on 2021/9/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let nav = NavigationController(rootViewController: ViewController())
        
        window?.rootViewController = nav
        
        window?.backgroundColor = UIColor.white
        
        window?.makeKeyAndVisible()
        
        return true
    }


}

