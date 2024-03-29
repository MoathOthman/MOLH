# MOLH
Localization helper for iOS apps mainly focusing on the LTR/RTL issue

# Install
Add `pod 'MOLH'` to your podfile. (check https://cocoapods.org/ for more info about cocoapods)

You can install it through Swift package manager as well.

# How To Use 
`import MOLH`

### Start
When you start the app

`MOLH.shared.activate(true)` 

**Make sure this method is called only once and not on every reset**

or 

`MOLH.shared.activate(false)` to not use swizzling and use subclassing from MOLH* UI classes.

### To reset the language

```
MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
MOLH.reset()
```

### Set default 
Before *.activate* set

`MOLHLanguage.setDefaultLanguage("ar")`

### using without swizzling (prefered)
you can choose to not use swizzling `MOLH.shared.activate(false)` , in that case you subclass MOLH-UI Subclasses , like `MOLHTextField` , this will give you more controlability as you can by-pass the *tag* requirement by using `forceSwitchingRegardlessOfTag` and set it to true.

## Images
To make sure an image is flipped when switching to RTL or to LTR, you can use `flipIfNeeded()` function on image or `UIImage().imageFlippedForRightToLeftLayoutDirection()`

### Fonts
Its better to have the app fonts in one place in your app, e.g. a **FontManager**. and there you can decide which font to use based on the chosen language, this would be the eaiser way. 

### Other Frameworks and bundles
Some controls such as ActionSheetDatePicker have locale property so you can set them appropriately e.g.

`actionSheetDatePicker?.locale = Locale(identifier: MOLHLanguage.currentLocaleIdentifier())`

## Common Issues
### Collection view content are flipped in a non readable way
use this line to solve it 
`collectionView.semanticContentAttribute = .unspecified`
Thanks to [didats](https://github.com/didats)

you may check [this post](https://medium.com/@dark_torch/working-with-localization-in-swift-part-2-e7c8a660eb2a).

### uilabel/uitextfield are not reflecting
make sure to set the tag and make sure the .activate method is only called once and not on every reset

# Author 
 * Twitter : [dark_torch](https://twitter.com/dark_torch)
 * Website: https://moathothman.com
 * Check my app PuzzPic http://apple.co/2a6Ow8W

# Support the library
If you enjoy MOLH and I want to say thank you, you can (buy me a coffee)[https://www.buymeacoffee.com/moathothman]
