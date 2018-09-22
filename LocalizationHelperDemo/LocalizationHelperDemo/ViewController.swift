//
//  ViewController.swift
//  LocalizationHelperDemo
//
//  Created by Moath_Othman on 6/2/17.
//  Copyright © 2017 Moath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var programmaticallylocalizedLabel: UILabel!
    @IBOutlet var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.programmaticallylocalizedLabel.text = NSLocalizedString("localize me please", comment: "Localize me Label in the main scene")
//        NotificationCenter.default.addObserver(self, selector: #selector(inputModeDidChange), name: .UITextInputCurrentInputModeDidChange, object: nil)
    }
    
//    @objc func inputModeDidChange(_ notification: Notification) {
//        if let language = self.textInputMode?.primaryLanguage, MOLHLanguage.isRTLLanguage(language: language) {
//            textField.textAlignment = .right
//        } else {
//            textField.textAlignment = .left
//        }
//    }
    
    @IBAction func switchTheLanguage(_ sender: UIButton) {
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
        MOLH.reset()
    }
    
    @IBAction func didEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func end(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    

}

