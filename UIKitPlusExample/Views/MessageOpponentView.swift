import UIKitPlus

class MessageOpponentView: UView {
    let message: Message
    
    init (_ message: Message) {
        self.message = message
        text = message.text
        time = message.time
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @UState var text: String
    @UState var time: String
    
    override func buildView() {
        super.buildView()
        height(>=49)
        body {
            UView {
                UText($text)
                    .font(.helveticaNeueRegular, 15)
                    .color(.blackHole)
                    .alignment(.left)
                    .multiline()
                    .edgesToSuperview(top: 17, leading: 24, trailing: -14, bottom: -13)
            }
            .width(>=80)
            .corners(16, .topLeft, .topRight, .bottomRight)
            .background(0xF2F4F9)
            .edgesToSuperview(top: 0, leading: 15, bottom: 0)
            .trailingToSuperview(<=-80)
            UText($time)
                .font(.helveticaNeueMedium, 13)
                .color(0xC7CDD6)
                .edgesToSuperview(trailing: -11, bottom: 0)
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct MessageOpponentView_Preview: PreviewProvider, UIKitPreviewProvider {
    static var colorScheme: PreviewColorScheme { .light }
    static var device: UIKitPreviewDevice { .iPhoneX }
    static var view: UIView {
        MessageOpponentView(.init(id: UUID(), text: "Hello world!", time: "", my: true))
            .centerYInSuperview()
            .edgesToSuperview(h: 0)
    }
}
#endif
