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

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct HelveticaNeueRegular_Preview: PreviewProvider, UIKitPreviewProvider {
    static var colorScheme: PreviewColorScheme { .light }
    static var layout: PreviewLayout { .fixed(width: 375, height: 50) }
    static var view: UIView {
        UText("This is helvetica neue regular font").font(.helveticaNeueRegular, 16).centerInSuperview().color(.black / .white)
    }
}
@available(iOS 13.0, *)
struct HelveticaNeueMedium_Preview: PreviewProvider, UIKitPreviewProvider {
    static var colorScheme: PreviewColorScheme { .light }
    static var layout: PreviewLayout { .fixed(width: 375, height: 50) }
    static var view: UIView {
        UText("This is helvetica neue medium font").font(.helveticaNeueMedium, 16).centerInSuperview().color(.black / .white)
    }
}
@available(iOS 13.0, *)
struct HelveticaNeueBold_Preview: PreviewProvider, UIKitPreviewProvider {
    static var colorScheme: PreviewColorScheme { .light }
    static var layout: PreviewLayout { .fixed(width: 375, height: 50) }
    static var view: UIView {
        UText("This is helvetica neue bold font").font(.helveticaNeueBold, 16).centerInSuperview().color(.black / .white)
    }
}
#endif


