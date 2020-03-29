import UIKitPlus

/// Declare your custom colors this way

extension UIColor {
    /// dynamic color (will be different in `dark` and `light` modes)
    static var dynamicColor = .red / .orange /// `.orange` will be used for `darkMode`
    
    /// `hex` color
    static var blackHole = 0x171A1D.color
    
    /// classic `UIColor`
    static var myColor = UIColor(red: 35, green: 127, blue: 201, alpha: 1)
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct DynamicColor_Preview: PreviewProvider, DeclarativePreview {
    static var preview: Preview {
        Preview {
            UView().edgesToSuperview().background(.dynamicColor)
        }
        .colorScheme(.light)
        .layout(.fixed(width: 100, height: 50))
    }
}
#endif
