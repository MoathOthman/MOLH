Working with localization in swift part 2 
Last year i write a post about localization covering some issues like switching language and right-to-left / left-to-right dilemma. 
In this post am going to cover more issues that faced me and others while dealing with this approach. I will introduce a small library to help us as well. 
The goals 
The main goals are 
Switching the language without a restart. 
Switching layout direction and semantics based on the language RTL/LTR. 
Avoid duplication (nibs,stories)
Simplicity (for real!!)

LocalizationHelper (MOLH)
LocalizationHelper is a small library to help you with the daunting issues that comes when you are dealing with more than one language where some of them are RTL languages and another's are LTR languages.
You can download the repository from here , which has a demo app within it.
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
You may add localization for storyboard and/or xibs , but I don’t advise that , it will become hard later to modify them. so it’s better to stick with the strings file.


