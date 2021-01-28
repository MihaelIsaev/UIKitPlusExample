//
//  MainViewController.swift
//  UIKitPlusExample
//
//  Created by Mihael Isaev on 29.01.2021.
//  Copyright © 2021 Swift Stream. All rights reserved.
//

import UIKitPlus

class MainViewController: ViewController {
    /// iOS9+ representation for `preferredStatusBarStyle`
    /// which works for every view controller if you use `RootController`
    /// NOTE: it is not affecting live preview,
    /// so you could see how it works in the app only
    override var statusBarStyle: StatusBarStyle { .light }
    
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
            UVScrollStack {
                UButton.gray.title("Diffable List").onTapGesture {
                    self.pushViewController(DiffableListViewController())
                }
                UVSpace(10)
                UButton.gray.title("Diffable Collection").onTapGesture {
                    self.pushViewController(DiffableCollectionViewController())
                }
                UVSpace(10)
                UButton.gray.title(.en("Simple Chat in 5 mins"), .ru("Простой чат за 6 минут")).onTapGesture {
                    self.pushViewController(ChatViewController())
                }
                UVSpace(10)
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
                UView {
                    UHStack {
                        UButton.github
                            .width(200)
                            .title(.en("Go to github!"), .ru("Перейти на github!"))
                            .onTapGesture(openGithub)
                        UButton.gray
                            .title(.en("OK"), .ru("Оки!"))
                            .width(80)
                            .onTapGesture { self.githubOpened = true }
                    }
                    .spacing(8)
                    .centerXInSuperview()
                    .edgesToSuperview(v: 0)
                }
                UVSpace(44)
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
        .title("Main screen")
    }
}
#endif
