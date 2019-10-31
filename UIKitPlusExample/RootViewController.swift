import UIKit
import UIKitPlus

class RootViewController: SimpleRootController {
    override var initialScreen: UIViewController {
        NavigationController(MainViewController()).style(.transparent).hideNavigationBar()
    }
}
