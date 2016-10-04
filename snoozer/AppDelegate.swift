//
//  AppDelegate.swift
//  snoozer
//
//  Created by Jeremie Girault on 04/10/2016.
//
//

import UIKit
import OAuthSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        
        window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if (url.path.hasPrefix("/oauth-callback/") && options[.sourceApplication] as? String == "com.apple.SafariViewService") {
            OAuthSwift.handle(url: url)
            return true
        }
        return false
    }
}

