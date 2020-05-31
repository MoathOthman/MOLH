//
//  AppDelegate.swift
//  LocalizationHelperDemo
//
//  Created by Moath_Othman on 6/2/17.
//  Copyright © 2017 Moath. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MOLHResetable {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        MOLHFont.shared.arabic = UIFont(name: "Courier", size: 13)!
        MOLHLanguage.setDefaultLanguage("ar")
        MOLH.shared.activate(true)
        MOLH.shared.specialKeyWords = ["Cancel","Done"]
        reset()
        return true
    }
    
    func reset() {
        let rootViewController: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        let story = UIStoryboard(name: "Main", bundle: nil)
        rootViewController.rootViewController = story.instantiateViewController(withIdentifier: "rootnav")
    }

}

