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
    @IBOutlet var labelWithFont: MOLHFontLocalizableLabel!
    @IBOutlet var textField: TextView!
    @IBOutlet var arrowImage: UIImageView! {
        didSet {
            arrowImage.image = arrowImage.image?.flipIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //   textField.forceSwitchingRegardlessOfTag = true
        self.programmaticallylocalizedLabel.text = NSLocalizedString("localize_me_please", comment: "Localize me Label in the main scene")
        
        self.labelWithFont.updateFont()
        
        let identifiers : NSArray = NSLocale.availableLocaleIdentifiers as NSArray
        let locale = NSLocale(localeIdentifier: "en_US")
        let list = NSMutableString()
        for identifier in identifiers {
            let name = locale.displayName(forKey: NSLocale.Key.identifier, value: identifier)!
            list.append("\(identifier)\t\(name)\n")
        }
        if #available(iOS 13.0, *) {
            labelWithFont.isUserInteractionEnabled = true
            let interaction = UIContextMenuInteraction(delegate: self)
            labelWithFont.addInteraction(interaction)
            
        } else {
            // Fallback on earlier versions
        }
        self.programmaticallylocalizedLabel.text = Locale.current.identifier
        //        let view = UIView()
        //        view.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 400))
        //        view.backgroundColor = .red
        //        print("current local", Locale.current.identifier)
        //        textField.inputView = view
        NotificationCenter.default.addObserver(self, selector: #selector(inputModeDidChange), name:  UITextInputMode.currentInputModeDidChangeNotification, object: nil)
    }
    
    @objc func inputModeDidChange(_ notification: Notification) {
        
        //        if let language = self.textInputMode?.primaryLanguage, MOLHLanguage.isRTLLanguage(language: language) {
        //            textField.textAlignment = .right
        //        } else {
        //            textField.textAlignment = .left
        //        }
    }
    
    @IBAction func switchTheLanguage(_ sender: UIButton) {
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
        MOLH.reset(transition: .transitionCrossDissolve, duration: 0.25)
    }
    
    @IBAction func didEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func end(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    
    
    //    override var textInputMode: UITextInputMode?{
    //        print("Total number of keyboards. : \(UITextInputMode.activeInputModes.count)")
    //
    //            for keyboardInputModes in UITextInputMode.activeInputModes {
    //                if let language = keyboardInputModes.primaryLanguage {
    //                    if language == "ar" {
    //                        print("success")
    //                        return keyboardInputModes;
    //                    }
    //                }
    //            }
    //
    //        print("failed")
    //        return super.textInputMode;
    //    }
}

//extension UIResponder {
//    open var textInputMode: UITextInputMode? {
//        CustomTextInput()
//    }
//}

class CustomTextInput: UITextInputMode {
    override var primaryLanguage: String? {
        return "fr"
    }
}

extension UIViewController {
    @objc open override var textInputMode: UITextInputMode? {
        CustomTextInput()
    }
}

final class TextView: UITextField {
    //    private var preferredTextInputModePrimaryLanguage: String? = "en"
    //
    //    /**
    //     Use given primary language for the preferred text input mode when next time text view becomes first responder.
    //     - Parameters:
    //        - primaryLanguage: `String` represents a primary language for the preferred text input mode. Use `"emoji"` to use Emoji keyboard.
    //     */
    //    func usePreferredTextInputModePrimaryLanguage(_ primaryLanguage: String) {
    //        preferredTextInputModePrimaryLanguage = primaryLanguage
    //    }
    //
    //    /**
    //     # UIKit Bug Workaround
    //     - Confirmed on iOS 13.0 to iOS 13.3.
    //     - Fixed on iOS 13.4.
    //     `textInputMode` override is completely ignored on these version of iOS 13 due to bug in `-[UIKeyboardImpl recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:]`,
    //     which has a flipped condition check, which doesn't always call `-[UIKeyboardImpl setInputMode:userInitiated:]`.
    //     To workaround this behavior, return non `nil` identifier from `textInputContextIdentifier` to call `-[UIKeyboardImpl setInputMode:userInitiated:]` from
    //     `-[UIKeyboardInputModeController _trackInputModeIfNecessary:]` and bypass `-[UIKeyboardImpl recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:]` call.
    //     Also need to clean up text input context identifier once it’s used for the bug workaround.
    //     - See also:
    //       - `becomeFirstResponder()`
    //       - `textInputContextIdentifier`
    //       - `textInputMode`
    //     */
    //    private let shouldWorkaroundTextInputModeBug: Bool = {
    //        // iOS 13.0 to iOS 13.3
    //        if #available(iOS 13.0, *) {
    //            if #available(iOS 13.4, *) {
    //                return false
    //            } else {
    //                return true
    //            }
    //        }
    //        return false
    //    }()
    //
    //    private let preferredTextInputModeContextIdentifier = ".preferredTextInputModeContextIdentifier"
    //
    //    override func becomeFirstResponder() -> Bool {
    //        let result = super.becomeFirstResponder()
    //        if result {
    //            if shouldWorkaroundTextInputModeBug {
    //                UIResponder.clearTextInputContextIdentifier(preferredTextInputModeContextIdentifier)
    //            }
    //            preferredTextInputModePrimaryLanguage =   "en"
    //        }
    //        return result
    //    }
    //
    //    override var textInputContextIdentifier: String? {
    //        if shouldWorkaroundTextInputModeBug, preferredTextInputModePrimaryLanguage != nil {
    //            return preferredTextInputModeContextIdentifier
    //        }
    //
    //        return super.textInputContextIdentifier
    //    }
    //
    //    override var textInputMode: UITextInputMode? {
    //        if
    //            let inputMode = UITextInputMode.activeInputModes.first(where: { $0.primaryLanguage?.contains("en") ?? false }) {
    //            return inputMode
    //        }
    //
    //        return super.textInputMode
    //    }
}

extension ViewController: UIContextMenuInteractionDelegate {
    @available(iOS 13.0, *)
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        
        let identifier = "\(location.debugDescription)" as NSString
        
        let info = UIAction(
            title: "ارابيم",
            image: UIImage(systemName: "info.circle")) { _ in
        }
        let mute = UIAction(
            title: "L10n.mute",
            image: UIImage(systemName: "speaker.slash")) { _ in
            //self.showAlert("Error", message: "Implement mute action", handler: nil)
        }
        
        let delete = UIAction(
            title: "زيايل",
            image: UIImage(systemName: "trash")) { _ in
            
        }
        
        let audioCall = UIAction(
            title: "نمستي رخه",
            image: UIImage(systemName: "phone")) { _ in
        }
        
        let videoCall = UIAction(
            title: "L10n.videoCall",
            image: UIImage(systemName: "video")) { _ in
        }
        
        _ = UIAction(
            title: "L10n.exitGroup",
            image: UIImage(systemName: "person.3")) { _ in
        }
        
        var menu = UIMenu()
        
        menu = UIMenu(title: "", children: [info, mute, delete, audioCall, videoCall])
        
        
        return UIContextMenuConfiguration(
            identifier: identifier,
            previewProvider: nil) { _ in
            return menu
        }
    }
}
