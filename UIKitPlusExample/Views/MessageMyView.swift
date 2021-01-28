import UIKitPlus

class MessageMyView: UView {
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
                    .color(.white)
                    .alignment(.right)
                    .multiline()
                    .edgesToSuperview(top: 17, leading: 14, trailing: -24, bottom: -13)
            }
            .width(>=80)
            .corners(16, .topLeft, .topRight, .bottomLeft)
            .background(0xC64072)
            .edgesToSuperview(top: 0, trailing: -15, bottom: 0)
            .leadingToSuperview(>=80)
            UText($time)
                .font(.helveticaNeueMedium, 13)
                .color(0xC7CDD6)
                .edgesToSuperview(leading: 11, bottom: 0)
        }
    }
}

#if canImport(SwiftUI)
import SwiftUI
@available(iOS 13.0, *)
struct MessageMyView_Preview: PreviewProvider, DeclarativePreview {
    static var preview: Preview {
        Preview {
            MessageMyView(
                .init(
                    id: UUID(),
                    text: "Hello world!",
                    time: "",
                    my: true
                )
            )
            .centerYInSuperview()
            .edgesToSuperview(h: 0)
        }
        .colorScheme(.light)
        .device(.iPhoneX)
        .language(.en)
    }
}
#endif
