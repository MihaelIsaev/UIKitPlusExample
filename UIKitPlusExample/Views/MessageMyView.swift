import UIKit
import UIKitPlus

class MessageMyView: View {
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
            Text($time)
                .font(.helveticaNeueMedium, 13)
                .color(0xC7CDD6)
                .edgesToSuperview(leading: 11, bottom: 0)
        }
    }
}
