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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.programmaticallylocalizedLabel.text = NSLocalizedString("localize me please", comment: "Localize me Label in the main scene")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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

