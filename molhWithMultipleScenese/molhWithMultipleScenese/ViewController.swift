//
//  ViewController.swift
//  molhWithMultipleScenese
//
//  Created by Moath_Othman on 4/25/20.
//  Copyright © 2020 moath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var programmaticallylocalizedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.programmaticallylocalizedLabel.text = NSLocalizedString("localize me please", comment: "Localize me Label in the main scene")
         // Do any additional setup after loading the view.
    }
    @IBAction func switchTheLanguage(_ sender: UIButton) {
          MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
          MOLH.reset(transition: .transitionCrossDissolve)
      }

}

