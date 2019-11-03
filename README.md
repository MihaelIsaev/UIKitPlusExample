# UIKitPlus Example 🧁
An example project for [UIKitPlus](https://github.com/MihaelIsaev/UIKitPlus) library 👏

### Requirements

This example is written for Xcode 11 (and macOS Catalina if you want live preview)

The lib itself works with iOS9+ (yeah-yeah cause it is pure UIKit! it is not SwiftUI!)

### How to use

Just download it, open `UIKitPlusExample.xcodeproj` and that's it

### Live Preview 🎉

To see Live Preview just go to `Live.swift` and pin the canvas

Again: `SwiftUI` here is only for `Live Preview` the lib itself is pure `UIKit`

<img width="1392" alt="Screen Shot 2019-10-31 at 10 42 08" src="https://user-images.githubusercontent.com/1272610/67925022-8a602380-fbcb-11e9-9901-0d0882bf0d5a.png">

### More examples

Please request for examples in issues I'll try to cover as much as I can 🚀

#### Watch this repo to be notified about new examples

<img width="366" alt="Screenshot 2019-10-31 at 13 54 37" src="https://user-images.githubusercontent.com/1272610/67936872-ff405700-fbe5-11e9-9f68-ea3cbc8c6f60.png">

# KNOW ISSUE

⚠️⚠️ This project doesn't compile in Xcode 11.2 because of compiler bug. Use Xcode 11.1 instead.
⚠️ don't use Xcode 11.2 because of compiler bug in it which is showing `Type of expression is ambiguous without more context` in function builders if expression is long. Use Xcode 11.1 cause there everything compiles fine. Hope this issue will be fixed in nearest Xcode update.

Xcode 11.1 available here [https://developer.apple.com/download/more/](https://developer.apple.com/download/more/)

If you experience any compilation problems in Xcode 11.1 please go to `Xcode -> Preferences -> Location` open derived data folder in finder and remove everything from it manually. Then restart Xcode and compile your project without any errors.
