/// press `Cmd + Opt + Enter` to show `Canvas`
/// and `pin` this canvas to always see it
#if canImport(SwiftUI) && DEBUG
import SwiftUI
import UIKitPlus
@available(iOS 13.0, *)
struct DemoView_Preview: PreviewProvider {
    static var previews: some SwiftUI.View {
        MainViewController() /// replace this line with your view controller or view
            .liveView
            .previewDevice(PreviewDevice(rawValue: "iPhone X"))
            .edgesIgnoringSafeArea(.vertical)
    }
}
#endif
