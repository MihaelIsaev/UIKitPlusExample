//
//  Images.swift
//  UIKitPlusExample
//
//  Created by Mihael Isaev on 29.01.2021.
//  Copyright © 2021 Swift Stream. All rights reserved.
//

import UIKitPlus

/// this way to declare `UIImage` and use it like `UImage(.myCustomImage)`
extension UIImage {
    static var iconBack: UIImage? { UIImage(named: "iconBack") }
    static var iconPaperclip: UIImage? { UIImage(named: "iconPaperclip") }
    static var iconSmile: UIImage? { UIImage(named: "iconSmile") }
    static var wwdcLogo: UIImage? { UIImage(named: "wwdc-logo") }
}

/// this way to declare `UImage` and use it like `UImage.myCustomImage`
extension UImage {
//    static var ___: UImage { UImage("___").mode(.scaleAspectFit) }
}
