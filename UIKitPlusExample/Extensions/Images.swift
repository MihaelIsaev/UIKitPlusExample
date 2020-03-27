import UIKitPlus

/// Declare your custom colors this way

/// this way to declare `UIImage` and use it like `Image(.myCustomImage)`
extension UIImage {
    static var iconBack: UIImage? { UIImage(named: "iconBack") }
    static var iconPaperclip: UIImage? { UIImage(named: "iconPaperclip") }
    static var iconSmile: UIImage? { UIImage(named: "iconSmile") }
    static var wwdcLogo: UIImage? { UIImage(named: "wwdc-logo") }
}

/// this way to declare `Image` and use it like `Image.myCustomImage`
extension Image {
//    static var ___: Image { Image("___").mode(.scaleAspectFit) }
}
