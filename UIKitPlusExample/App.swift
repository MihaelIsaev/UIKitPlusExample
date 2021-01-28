//
//  App.swift
//  UIKitPlusExample
//
//  Created by Mihael Isaev on 29.01.2021.
//  Copyright © 2021 Swift Stream. All rights reserved.
//

import UIKitPlus

class App: BaseApp {
    @AppBuilder override var body: AppBuilderContent {
        Lifecycle.didFinishLaunching {
            self.$pushNotificationToken.listen { token in
                // handle your push token here
                print("push token: \(token ?? "n/a")")
            }
            // request push token authorization like this
            App.requestPushNotificationsAuthorization(.alert, .sound, .badge)
        }.willResignActive {
            
        }.willEnterForeground {
            
        }
        MainScene { .main } // you could check authorization here and show other screens like .login or .splash or your custom
            .mainScreen {
                NavigationController(MainViewController()).style(.transparent).hideNavigationBar()
            }
//            .splashScreen {
//                SplashViewController()
//            }
//            .loginScreen {
//                NavigationController(WelcomeViewController()).style(.transparent).hideNavigationBar()
//            }
//        Shortcuts {
//            Shortcut("A").title("Test 1").icon(type: .audio)
//            Shortcut("B").title("Test 2").subTitle("Hello world").icon(type: .bookmark)
//        }
    }
}
