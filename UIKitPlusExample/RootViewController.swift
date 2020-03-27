import UIKitPlus

class RootViewController: SimpleRootController {
    override var initialScreen: UIViewController {
        NavigationController(MainViewController()).style(.transparent).hideNavigationBar()
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct RootViewController_Preview: PreviewProvider, UIKitPreviewProvider {
    static var colorScheme: PreviewColorScheme { .light }
    static var device: UIKitPreviewDevice { .iPhoneX }
    static var view: UIView { RootViewController().view }
}
#endif
