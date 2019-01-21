# MOLH
Localization helper for iOS apps mainly focusing on the LTR/RTL issue

# Install
Add `pod 'MOLH'` to your podfile. (check https://cocoapods.org/ for more info about cocoapods)

# How To Use 
`import MOLH`

### Start
When you start the app

`MOLH.shared.activate(true)` 

or 

`MOLH.shared.activate(false)` to not use swizzling and use subclassing from MOLH* UI classes.

### To reset the language

```
MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == “en” ? “ar” : “en”)
MOLH.reset()
```

### Set default 
Before *.activate* set

`MOLHLanguage.setDefaultLanguage("ar")`

### Other Frameworks and bundles
Some controls such as ActionSheetDatePicker have locale property so you can set them appropriately e.g.

`actionSheetDatePicker?.locale = Locale(identifier: MOLHLanguage.currentLocaleIdentifier())`

you may check [this post](https://medium.com/@dark_torch/working-with-localization-in-swift-part-2-e7c8a660eb2a).


# Author 
 * Twitter : [dark_torch](https://twitter.com/dark_torch)
 * Website: https://moathothman.com
 * Check my app PuzzPic http://apple.co/2a6Ow8W
 
