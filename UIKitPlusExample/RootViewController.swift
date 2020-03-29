import UIKitPlus

class RootViewController: SimpleRootController {
    override var initialScreen: UIViewController {
        NavigationController(MainViewController()).style(.transparent).hideNavigationBar()
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct RootViewController_Preview: PreviewProvider, DeclarativePreview {
    static var preview: Preview {
        Preview {
            RootViewController()
        }
        .colorScheme(.light)
        .device(.iPhoneX)
    }
}
#endif
