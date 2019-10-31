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
    lazy var imageView = Image(.wwdcLogo)
    
    override func buildUI() {
        super.buildUI()
        view.backgroundColor = .darkGray
        body {
            titleText
                .text("UIKitPlus is a 🧁")
                .font(.helveticaNeueBold, 30)
                .color(.white)
                .topToSuperview(44, safeArea: true)
                .centerXInSuperview()
            imageView
                .mode(.scaleAspectFill)
                .size(140)
                .circle()
                .border(2, .white)
                .top(to: titleText, 44)
                .centerXInSuperview()
            VStack {
                Button.gray.title("Diffable List").onTapGesture {
                    self.pushViewController(DiffableListViewController())
                }
                Button.gray.title("Diffable Collection").onTapGesture {
                    self.pushViewController(DiffableCollectionViewController())
                }
                Button.gray.title("Simple Chat in 5 mins").onTapGesture {
                    self.pushViewController(ChatViewController())
                }
            }
            .spacing(10)
            .top(to: imageView, 44)
            .edgesToSuperview(leading: 16, trailing: -16)
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
            .bottomToSuperview(-16, safeArea: true)
            Text("🎉 Thank you very much!!! ❤️").alignment(.center)
                .hidden($githubOpened.map { !$0 })
                .edgesToSuperview(leading: 0, trailing: 0)
                .bottomToSuperview(-30, safeArea: true)
        }
    }
    
    func pushViewController(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
}
