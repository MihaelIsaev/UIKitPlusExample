import UIKitPlus

/// Declare your custom fonts this way
///
/// TIP: to get the list of all available font names on device
/// run `UIFont.printAll()` in `AppDelegate.didFinishLaunchingWithOptions`
///
/// if you'd like to add custom fonts
/// 1) add them to the project files e.g. `Fonts` folder
/// 2) add them to the `Info.plist`
/// 3) print them all in `AppDelegate`
/// 4) add them in this file
///

extension FontIdentifier {
    static var helveticaNeueRegular = FontIdentifier("HelveticaNeue")
    static var helveticaNeueMedium = FontIdentifier("HelveticaNeue-Medium")
    static var helveticaNeueBold = FontIdentifier("HelveticaNeue-Bold")
}
