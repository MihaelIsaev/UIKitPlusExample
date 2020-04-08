import UIKitPlus

class NavigationBarView: UView {
    lazy var backButton = Button.back
        .edgesToSuperview(leading: 16, bottom: -20)
    
    lazy var titleLabel = Text()
        .alignment(.center)
        .font(.helveticaNeueMedium, 18)
        .color(0x1c1c1c.color / .white)
        .multiline()
        .centerXInSuperview()
        .centerY(to: backButton)
    
    override func buildView() {
        super.buildView()
        body {
            backButton
            titleLabel
        }
        height(80 !! .iPhoneX(100) !! .iPhoneXMax(100)) /// different value for different devices
        background(.white / .darkGray)
        corners(32, .bottomLeft, .bottomRight)
        shadow(0xA0ABCE, opacity: 1, x: 0, y: -4, radius: 10)
        edgesToSuperview(top: 0, leading: 0, trailing: 0)
    }
}

#if canImport(SwiftUI)
import SwiftUI
@available(iOS 13.0, *)
struct NavigationBarView_Preview: PreviewProvider, DeclarativePreview {
    static var preview: Preview {
        Preview {
            NavigationBarView()
        }
        .colorScheme(.dark)
        .device(.iPhoneX)
        .language(.en)
    }
}
#endif
