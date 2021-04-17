//
//  AppDelegate.swift
//  Dependency Injection
//
//  Created by Dino Catalinac on 15.04.2021..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window?.rootViewController = UINavigationController(rootViewController: ShopVC())
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

