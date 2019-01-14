//
//  L102Language.swift
//  Localization102
//
//  Created by Moath_Othman on 2/24/16.
//  Copyright © 2016 Moath_Othman. All rights reserved.
//

import UIKit

/// constants
private let APPLE_LANGUAGE_KEY = "AppleLanguages"
private let MOLHFirstTimeLanguage = "plhfirsttimelanguage"
/**
 **MOLHLanguage** is responsible for getting and setting the language.
    - fetch current language without locale
    - get current language with locale
    - set current language
    - set default language 
    - check if current language is RTL
    - check if current language is Arabic
    - check if a text has english chars
 
 @auther Moath Othman
 */
open class MOLHLanguage {
    public static let shared = MOLHLanguage()
    
    /// get current Apple language
    public class func currentAppleLanguage() -> String {
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.firstObject as! String
        let endIndex = current.index(current.startIndex, offsetBy: 2)
        let currentWithoutLocale = current[current.startIndex..<endIndex]
        return String(currentWithoutLocale)
    }
    
    /**
     Get the current language with locae e.g. ar-KW

     @return language identifier string
     */
    public class func currentLocaleIdentifier() -> String {
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.firstObject as! String
        return current
    }
    
    /// set @lang to be the first in Applelanguages list
    public class func setAppleLAnguageTo(_ lang: String) {
        let userdef = UserDefaults.standard
        userdef.set([lang,currentAppleLanguage()], forKey: APPLE_LANGUAGE_KEY)
        userdef.synchronize()
    }
    
    /**
     Set the default language
     
     @param language string
     
     @return void
     */
    public class func setDefaultLanguage(_ language: String) {
        if !UserDefaults.standard.bool(forKey: MOLHFirstTimeLanguage) {
            MOLH.setLanguageTo(language)
            UserDefaults.standard.set(true, forKey: MOLHFirstTimeLanguage)
        }
    }
    
    /**
     **Check if the current language is Arabic**
     @description see if the prefix of the language is ar
     
     @return is arabic boolean
     */
    public class func isArabic() -> Bool {
        return currentAppleLanguage() == "ar"
    }
    
    /**
     **Check the current Layout direction is right to left**

     @return boolean
     */
    @available(*, deprecated, message: "Use isRTLLanguage")
    public static func isRTL() -> Bool {
        return isRTLLanguage()
    }
    
    /**
     Check if the text is english text
     
     @param text to be checked
     
     @return true of it has english text
     */
    public static func hasEnglishText(text: String) -> Bool {
        return text.rangeOfCharacter(from: CharacterSet(charactersIn: "1234567890poiuytrewqasdfghjklmnbvcxz")) != nil
    }
    
    /**
     Check if the current language is a right to left language
     
     @return true if its a right to left language
     */
    public static func isRTLLanguage() -> Bool {
        return currentLocaleIdentifier().hasPrefix("ar") || currentLocaleIdentifier().hasPrefix("fa")
    }
    
    /**
     Check if the current language is a right to left language
     
     @param language to be tested

     @return true if its a right to left language
     */
    public static func isRTLLanguage(language: String) -> Bool {
        return language.hasPrefix("ar") || language.hasPrefix("fa")
    }
}
