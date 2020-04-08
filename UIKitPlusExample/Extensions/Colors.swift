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

#if canImport(SwiftUI)
import SwiftUI
@available(iOS 13.0, *)
struct Colors_Preview: PreviewProvider, DeclarativePreviewGroup {
    static var previewGroup: PreviewGroup {
        PreviewGroup {
            Preview {
                UView().edgesToSuperview().background(.dynamicColor)
            }
            .title("dynamicColor")
            .colorScheme(.light)
            .layout(.fixed(width: 200, height: 50))
            Preview {
                UView().edgesToSuperview().background(.blackHole)
            }
            .title("blackHole")
            .colorScheme(.light)
            .layout(.fixed(width: 200, height: 50))
            Preview {
                UView().edgesToSuperview().background(.myColor)
            }
            .title("myColor")
            .colorScheme(.light)
            .layout(.fixed(width: 200, height: 50))
        }
    }
}
#endif
