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
        
        //login
        let loginViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginViewController.uiController = LoginLightScreen()
        
        
        //adding a nav bar at top for controlling pages
        //let Nav = UINavigationController.init(rootViewController: loginViewController)
        //AppDelegate.shared().window?.rootViewController = Nav
        
        
        AppDelegate.shared().window?.rootViewController = loginViewController
        AppDelegate.shared().window?.makeKeyAndVisible()
        
        //configure firebase
        FirebaseApp.configure()
        return true
    }
    class func shared() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    
}

