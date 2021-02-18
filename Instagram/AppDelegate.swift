//
//  AppDelegate.swift
//  Instagram
//
//  Created by craterzone on 04/02/21.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //keyboard Manager
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        //configure firebase
        FirebaseApp.configure()
        
        //show first page
        if Auth.auth().currentUser != nil {
          // User is signed in.
            let showFirstController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "RootViewController") as! RootViewController
            AppDelegate.shared().window?.rootViewController = showFirstController
        } else {
          // No user is signed in.
          // ...
            let showFirstController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            showFirstController.uiController = LoginLightScreen()
            AppDelegate.shared().window?.rootViewController = showFirstController
        }
        
        //adding a nav bar at top for controlling pages
        //let Nav = UINavigationController.init(rootViewController: loginViewController)
        //AppDelegate.shared().window?.rootViewController = Nav
        
        AppDelegate.shared().window?.makeKeyAndVisible()

        
        return true
    }
    class func shared() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    
}

