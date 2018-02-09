Working with localization in swift part 2
Last year i write a post about localization covering some issues like switching language and right-to-left / left-to-right dilemma.

In this post am going to introduce a small library to do the heavy lifting for you.

The goals
The main goals are

Switching the language without a restart.
Switching layout direction and semantics based on the language RTL/LTR.
Avoid duplication (nibs,stories)
Simplicity (for real!!)
LocalizationHelper (MOLH)
LocalizationHelper is a small library to help you with the daunting issues that comes when you are dealing with more than one language where some of them are RTL languages and another's are LTR languages.

You can download the repository from here , which has a demo app within it.

to install MOLH through Pods add

pod 'MOLH'
to your podfile. (check https://cocoapods.org/ for more info about cocoapods)

How to use

in the Appdelegate `didFinishLaunchingWithOptions` method add

MOLH.shared.activate(true)
‘True’ to use swizzling, leaving most of the work on MOLH, otherwise you have to do some extra work. We will go through that.

Enable localization

Add Localizable.strings file
Project -> YOUR_PROJECT_NAME -> localization -> hit the plus language and add YOUR_LANGUAGE in our demo we add Arabic as its an RTL language.
Lastly add some text in the strings files in this format
` “TextToLocalize” = “itsLocalization”;

You may add localization for storyboard and/or xibs , but I don’t advise that , it will become hard later to modify them. so it’s better to stick with the strings file.
Take effect
The kind of views that are affected by MOLH are UIControl, UILabel, UITextField,UITextView,UIImageView,UIButton. These views are affected by the RTL/LTR e.g. textAlignment , control alignment and UIImage direction.

If you are not using swizzling then use the appropriate subclass from MOLH e.g. MOLHLabel.

The most important factor for a view here is the tag .

If it's less than zero MOLH will consider that it wishes to adapt the natural direction and it will be affected. By default all views have zero tag and hence not affected, so it’s an opt-in feature.

For the autolayout flipping you don’t need to do anything. Though, to opt-out, then from attribute inspector click on one of the items and uncheck “Respect language direction” .

Custom Views
For your custom views and custom layout you may need to check for the language manually and there you can use

MOLHLanguage.isRTL()
function.

e.g.

if MOLHLanguage.isRTL() {
titleLabel?.font = UIFont.appSettingNotSelectedFontArabi()
}
Change the language
You probably have somewhere in your app a change language button/cell/…

in that function call you need to call setLanguage “accept with locale like en-us” and reset. e.g.

MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == “en” ? “ar” : “en”)
MOLH.reset()
back to Appdelegate.swift , add conformance to MOLHResetable, and implement the reset function. It’s better IMO to handle reloading viewcontrollers in somewhere close to the Appdelegate.

Other Frameworks and bundles
MOLH currently affects the app bundle only, and since other frameworks may have UI elements with their localization bundled with them, MOLH can’t access them and reload them.

Some controls such as ActionSheetDatePicker have locale property so you can set them appropriately e.g.

actionSheetDatePicker?.locale = Locale(identifier: MOLHLanguage.currentLocaleIdentifier())
others don’t, and in that case you need to handle their localization yourself and simply tell MOLH that those words will be handled by the app bundle. you can do that using specialKeyWords

MOLH.shared.specialKeyWords = [“Cancel”,”Done”]
where cancel and done are strings used by another bundle and you are providing localizations for them in your Localizable.string.

Fonts
it’s possible using MOLHFont to specify an arabic font e.g.

MOLHFont.shared.arabic = R.font.winSoftProMedium(size: 18)!
and there is a method you can use on UIButton,UITextField,UILabel,UITextView called updatefont(), that you can call to change the font into arabic if needed , currently MOLH support specifing arabic font, since I haven’t used another languages tbh :/.

or you may inherit from MOLHFont<UIType>.

Finale
MOLH helped me in a couple of a production apps , I hope it does for you too:). Its far from complete solution and contribution is very welcome. 
Happy Coding.
