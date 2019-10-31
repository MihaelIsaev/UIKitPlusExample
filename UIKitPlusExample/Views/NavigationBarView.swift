import UIKit
import UIKitPlus

class NavigationBarView: View {
    lazy var backButton = Button.back
        .edgesToSuperview(leading: 16, bottom: -20)
    
    lazy var titleLabel = Text()
        .alignment(.center)
        .font(.helveticaNeueMedium, 18)
        .color(0x1c1c1c)
        .multiline()
        .centerXInSuperview()
        .centerY(to: backButton)
    
    override func buildView() {
        super.buildView()
        body {
            backButton
            titleLabel
        }
        height(64 !! .iPhoneX(100) !! .iPhoneXMax(100)) /// different value for different devices
        background(.white)
        corners(32, .bottomLeft, .bottomRight)
        shadow(0xA0ABCE, opacity: 1, x: 0, y: -4, radius: 10)
        edgesToSuperview(top: 0, leading: 0, trailing: 0)
    }
}
