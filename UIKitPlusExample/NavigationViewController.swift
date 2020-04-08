import UIKitPlus

class NavigationViewController: ViewController {
    lazy var navigationBar = NavigationBarView()
    
    override var title: String? {
        get { navigationBar.titleLabel.text }
        set { navigationBar.titleLabel.text(newValue ?? "") }
    }
    
    override func buildUI() {
        super.buildUI()
        body {
            navigationBar
        }
        navigationBar.backButton.onTapGesture {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.bringSubviewToFront(navigationBar)
    }
}

#if canImport(SwiftUI)
import SwiftUI
@available(iOS 13.0, *)
struct NavigationViewController_Preview: PreviewProvider, DeclarativePreview {
    static var preview: Preview {
        Preview {
            NavigationViewController()
        }
        .colorScheme(.light)
        .device(.iPhoneX)
        .language(.en)
    }
}
#endif
