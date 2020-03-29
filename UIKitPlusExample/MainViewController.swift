import UIKitPlus

/// if you pinned canvas in `Live.swift`
/// then try to change anything here to see live preview
class MainViewController: ViewController {
    /// iOS9+ representation for `preferredStatusBarStyle`
    /// which works for every view controller if you use `RootController`
    override var statusBarStyle: StatusBarStyle { .light } /// doesn't work in live preview
    
    @UState var githubOpened = false
    
    lazy var titleText = UText()
    lazy var imageView = UImage(.wwdcLogo)
    
    override func buildUI() {
        super.buildUI()
        view.backgroundColor = .darkGray / .black
        body {
            titleText
                .text(.en("UIKit is a 🧁"), .ru("UIKit еще хорош! 🔥"))
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
            VScrollStack {
                UButton.gray.title("Diffable List").onTapGesture {
                    self.pushViewController(DiffableListViewController())
                }
                VSpace(10)
                UButton.gray.title("Diffable Collection").onTapGesture {
                    self.pushViewController(DiffableCollectionViewController())
                }
                VSpace(10)
                UButton.gray.title(.en("Simple Chat in 5 mins"), .ru("Простой чат за 6 минут")).onTapGesture {
                    self.pushViewController(ChatViewController())
                }
                VSpace(10)
                UButton.gray.title("Map View").onTapGesture {
                    self.pushViewController(MapViewController())
                }
            }
            .background(.clear)
            .top(to: imageView, 44)
            .edgesToSuperview(leading: 16, trailing: -16)
            .bottomToSuperview(-110, safeArea: true)
            UVStack {
                UText(.en("If you like UIKitPlus please give it a ⭐️"), .ru("Плиз поставь ⭐️"))
                    .multiline() // the same as `lines = 0`
                    .alignment(.center)
                    .font(.helveticaNeueRegular, 18)
                UHStack {
                    UButton.github
                        .title(.en("Go to github!"), .ru("Перейти на github!"))
                        .onTapGesture(openGithub)
                    UButton.gray
                        .title(.en("OK"), .ru("Оки!"))
                        .width(80)
                        .onTapGesture { self.githubOpened = true }
                }.spacing(8)
            }
            .hidden($githubOpened)
            .spacing(10)
            .edgesToSuperview(leading: 16, trailing: -16)
            .bottomToSuperview(-16, safeArea: true)
            UText(.en("🎉 Thank you very much!!! ❤️"), .ru("🎉 Спасибо большое!!! ❤️"))
                .alignment(.center)
                .hidden($githubOpened.map { !$0 })
                .edgesToSuperview(leading: 0, trailing: 0)
                .bottomToSuperview(-30, safeArea: true)
        }
    }
    
    func pushViewController(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func openGithub() {
        guard let url = URL(string: "https://github.com/MihaelIsaev/UIKitPlus") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:]) { self.githubOpened = $0 }
        } else {
            self.githubOpened = UIApplication.shared.openURL(url)
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct MainViewController_Preview: PreviewProvider, DeclarativePreview {
    static var preview: Preview {
        Preview {
            MainViewController()
        }
        .colorScheme(.dark)
        .device(.iPhoneX)
        .language(.en)
    }
}
#endif
