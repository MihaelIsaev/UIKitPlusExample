import UIKit
import UIKitPlus

/// if you pinned canvas in `Live.swift`
/// then try to change anything here to see live preview
class MainViewController: ViewController {
    /// iOS9+ representation for `preferredStatusBarStyle`
    /// which works for every view controller if you use `RootController`
    override var statusBarStyle: StatusBarStyle { .light } /// doesn't work in live preview
    
    @State var githubOpened = false
    
    lazy var titleText = Text()
    
    override func buildUI() {
        super.buildUI()
        view.backgroundColor = .darkGray
        body {
            titleText
                .text("UIKitPlus is a 🧁")
                .font(.helveticaNeueBold, 30)
                .color(.white)
                .topToSuperview(50, safeArea: true)
                .centerXInSuperview()
            Image(.wwdcLogo)
                .mode(.scaleAspectFill)
                .size(200)
                .circle()
                .border(2, .white)
                .top(to: titleText, 44)
                .centerXInSuperview()
            VStack {
                Text("If you like this lib please give it a ⭐️")
                    .multiline() // the same as `lines = 0`
                    .alignment(.center)
                    .font(.helveticaNeueRegular, 18)
                Button.github.title("Go to github!").onTapGesture {
                    guard let url = URL(string: "https://github.com/MihaelIsaev/UIKitPlus") else { return }
                    UIApplication.shared.open(url, options: [:]) { self.githubOpened = $0 }
                }
            }
            .hidden($githubOpened)
            .spacing(10)
            .edgesToSuperview(leading: 16, trailing: -16)
            .bottomToSuperview(0, safeArea: true)
            Text("🎉 Thank you very much!!! ❤️").alignment(.center)
                .hidden($githubOpened.map { !$0 })
                .edgesToSuperview(leading: 0, trailing: 0)
                .bottomToSuperview(-30, safeArea: true)
        }
    }
}
