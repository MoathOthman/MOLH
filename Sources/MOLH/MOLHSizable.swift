//
//  MOLHSizable.swift
//  Demo
//
//  Created by Moath_Othman on 2/5/17.
//  Copyright © 2017 Moath. All rights reserved.
//

import Foundation
import UIKit

public enum DeviceWidthtype {
    case fouror3
    case four7
    case five5
    
    static var type: DeviceWidthtype {
        let width = UIScreen.main.bounds.width
        if  width >= 414 {
            return .five5
        } else if width >= 375 {
            return .four7
        } else {
            return .fouror3
        }
    }
}


open class MOLHSizableLayoutConstraint: NSLayoutConstraint  {
    var fourDeduction: CGFloat = 0.0
    var fourSevenDeduction: CGFloat = 0.0
    open override var constant: CGFloat {
        get {
            let c = super.constant
            var sizedConstant = c
            switch DeviceWidthtype.type {
            case .fouror3:
                sizedConstant -= c * self.fourDeduction
                break
            case .four7:
                 sizedConstant -= c * self.fourSevenDeduction
                break
            case .five5:
                break
            }
            return sizedConstant
        }
        set {
            super.constant = newValue
        }
    }
}
