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
        return true
    }
    
    func reset() {
        let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        let stry = UIStoryboard(name: "Main", bundle: nil)
        rootviewcontroller.rootViewController = stry.instantiateViewController(withIdentifier: "rootnav")
    }

}

