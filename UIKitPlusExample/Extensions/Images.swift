import UIKit
import UIKitPlus

/// Declare your custom colors this way

/// this way to declare `UIImage` and use it like `Image(.myCustomImage)`
extension UIImage {
    static var iconBack: UIImage? { UIImage(named: "iconBack") }
    static var iconPaperclip: UIImage? { return UIImage(named: "iconPaperclip") }
    static var iconSmile: UIImage? { return UIImage(named: "iconSmile") }
    static var wwdcLogo: UIImage? { UIImage(named: "wwdc-logo") }
//    static var ___: UIImage? { UIImage(named: "___") }
}

/// this way to declare `Image` and use it like `Image.myCustomImage`
extension Image {
//    static var ___: Image { Image("___").mode(.scaleAspectFit) }
}
