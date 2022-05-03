//
//  StackViewTestViewController.swift
//  LocalizationHelperDemo
//
//  Created by Moath_Othman on 5/3/22.
//  Copyright © 2022 Moath. All rights reserved.
//

import UIKit

class StackViewTestViewController: UIViewController {

    @IBOutlet var label2: UILabel!
    @IBOutlet var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        label1.text = NSLocalizedString("stack_view_label_1", comment: "")
        label2.text = NSLocalizedString("stack_view_label_2", comment: "")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
