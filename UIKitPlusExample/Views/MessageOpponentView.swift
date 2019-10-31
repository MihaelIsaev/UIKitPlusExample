import UIKit
import UIKitPlus

class MessageOpponentView: View {
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
    
    @State var text: String
    @State var time: String
    
    override func buildView() {
        super.buildView()
        height(>=49)
        body {
            View {
                Text($text)
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
            Text($time)
                .font(.helveticaNeueMedium, 13)
                .color(0xC7CDD6)
                .edgesToSuperview(trailing: -11, bottom: 0)
        }
    }
}
