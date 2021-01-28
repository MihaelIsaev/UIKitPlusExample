import UIKitPlus

class ChatViewController: NavigationViewController {
    override var statusBarStyle: StatusBarStyle { .dark }

    @UState var opponentAvatar: String? = "https://avatars1.githubusercontent.com/u/1272610?s=460&v=4"

    @UState var messages: [Message] = []

    var list: UList!

    @UState var typedText = ""

    deinit {
        print("ChatViewController deinit")
    }

    override func buildUI() {
        super.buildUI()
        title = "Chat with iMike"
        navigationBar.body {
            UImage(url: $opponentAvatar)
                .mode(.scaleAspectFill)
                .size(40)
                .circle()
                .centerY(to: navigationBar.titleLabel)
                .trailing(to: .leading, of: navigationBar.titleLabel, -16)
        }
        $typedText.listen {
            print("typedText: \($0)")
        }
        body {
            UView {
                // MARK: Messages Container
                UList {
                    UForEach($messages) {
                        UVSpace(16)
                        if $0.my {
                            MessageMyView($0)
                        } else {
                            MessageOpponentView($0)
                        }
                    }
                    UVSpace(110)
                }
                .separatorStyle(.none)
                .itself(&list)
                .reversed()
                .edgesToSuperview(top: 0, leading: 0, trailing: 0)

                // MARK: Bottom Bar
                UView {
                    UHStack {
                        UButton()
                            .size(40)
                            .image(.iconPaperclip)
                            .tint(0x9FA4B6)
                            .onTapGesture { [weak self] in
                                self?.appendMessage("<attachment should be here> 🤯")
                            }
                        UTextField($typedText)
                            .placeholder(
                                "Type your message"
                                    .foreground(0x91969E)
                                    .font(.helveticaNeueRegular, 15)
                            )
                            .color(.black)
                            .tint(.black)
                            .height(40)
                            .leftView(UHSpace(16))
                            .background(0xF5F6F7)
                            .circle()
                            .returnKeyType(.send)
                            .shouldReturn { [weak self] in
                                if $0.text?.count == 0 {
                                    $0.resignFirstResponder()
                                } else {
                                    self?.appendMessage($0.text ?? "")
                                    $0.text = ""
                                }
                                return false
                            }
                        UButton()
                            .size(40)
                            .image(.iconSmile)
                            .tint(0x9FA4B6)
                            .onTapGesture { [weak self] in
                                self?.appendMessage("😍")
                            }
                    }
                    .alignment(.center)
                    .spacing(8)
                    .edgesToSuperview(top: 20, leading: 12, trailing: -12)
                    .bottomToSuperview(-20, safeArea: true)
                }
                .background(.white)
                .top(to: .bottom, of: list)
                .edgesToSuperview(leading: 0, trailing: 0, bottom: 0)
                .corners(32, .topLeft, .topRight)
                .shadow(.black, opacity: 0.07, x: 0, y: 0, radius: 6)
            }
            .edgesToSuperview(top: 0, leading: 0, trailing: 0)
            .bottomToSuperview($keyboardHeight.map { -1 * $0 })
            .onTapGesture { [weak self] in
                self?.view.endEditing(true)
            }
        }
    }

    func appendMessage(_ text: String) {
        ImpactFeedback.selected()
        messages.insert(.init(id: UUID(), text: text, time: "00:00 XX", my: true), at: 0)
    }

    override func viewDidAppearFirstTime(_ animated: Bool) {
        super.viewDidAppearFirstTime(animated)
        mockMessages()
    }

    func mockMessages() {
        messages = [
            .init(id: UUID(), text: "Looks good", time: "11:26 PM", my: true),
            .init(id: UUID(), text: "In hac habitasse platea dictumst. Vivamus adipiscing fermentum", time: "11:24 PM", my: false),
            .init(id: UUID(), text: "Ok :)", time: "07:38 PM", my: false),
            .init(id: UUID(), text: "In hac habitasse platea dictumst. Vivamus adipiscing fermentum quam volutpat aliquam. Integer et elit eget elit facilisis tristique. Nam vel iaculis mauris. Sed ullamcorper tellus erat, non ultrices sem tincidunt euismod. Fusce rhoncus porttitor velit, eu bibendum nibh aliquet vel. Fusce lorem leo, vehicula at nibh quis, facilisis accumsan turpis.", time: "07:36 PM", my: true),
            .init(id: UUID(), text: "Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec.", time: "07:35 PM", my: true),
            .init(id: UUID(), text: "Fusce vehicula dolor arcu, sit amet blandit dolor mollis nec.", time: "07:29 PM", my: false),
            .init(id: UUID(), text: "Lorem ipsum Dolor 😆", time: "07:28 PM", my: false)
        ]
    }
}

extension ChatViewController {
    static var mock: ChatViewController {
        let vc = ChatViewController()
        vc.mockMessages()
        return vc
    }
}

#if canImport(SwiftUI)
import SwiftUI
@available(iOS 13.0, *)
struct ChatViewController_Preview: PreviewProvider, DeclarativePreview {
    static var preview: Preview {
        Preview {
            ChatViewController.mock
        }
        .colorScheme(.light)
        .device(.iPhoneX)
        .language(.en)
    }
}
#endif
