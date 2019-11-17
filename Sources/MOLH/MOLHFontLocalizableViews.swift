//
//  MOLHFontLocalizableViews.swift
//  Demo
//
//  Created by Moath_Othman on 1/27/17.
//  Copyright © 2017 Moath. All rights reserved.
//

import Foundation
import UIKit

public protocol MOLHFontable {
    func updateFont()
}

extension UIButton: MOLHFontable {
    public func updateFont() {
        if MOLHLanguage.isArabic() {
            titleLabel?.font = UIFont(name: MOLHFont.shared.arabic.fontName, size: titleLabel?.font.pointSize ?? 0)
        }
    }
}

extension UILabel: MOLHFontable {
    public func updateFont() {
        if MOLHLanguage.isArabic() && !MOLHLanguage.hasEnglishText(text: self.text ?? "")  {
            self.font = UIFont(name: MOLHFont.shared.arabic.fontName, size: font.pointSize)
        }
    }
}


extension UITextField: MOLHFontable {
    public func updateFont() {
        if MOLHLanguage.isArabic() && !MOLHLanguage.hasEnglishText(text: self.text ?? "") {
            font = UIFont(name: MOLHFont.shared.arabic.fontName, size: font?.pointSize ?? 0)
        }
    }
}

extension UITextView: MOLHFontable {
    public func updateFont() {
        if MOLHLanguage.isArabic() && !MOLHLanguage.hasEnglishText(text: self.text) {
            font = UIFont(name: MOLHFont.shared.arabic.fontName, size: font?.pointSize ?? 0)
        }
    }
}

open class MOLHFontLocalizableButton: UIButton {
    override open func awakeFromNib() {
        super.awakeFromNib()
        updateFont()
    }
}

open class MOLHFontLocalizableLabel: UILabel {
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    override open var text: String? {
        didSet {
            updateFont()
        }
    }
}

open class MOLHFontLocalizableTextField: UITextField {
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    override open var text: String? {
        didSet {
            updateFont()
        }
    }
}

open class MOLHFontLocalizableTextView: UITextView {
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    override open var text: String? {
        didSet {
            updateFont()
        }
    }
}

