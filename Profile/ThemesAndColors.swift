//
//  ThemesAndColors.swift
//  Navigation
//
//  Created by v.milchakova on 27.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

struct Theme {
    enum ThemeName {
        case light
        case dark
    }
    let type: ThemeName
    let colors: ColorPalette
}

enum ColorPalette {
    case light
    case dark
}

extension Theme {
    static let light = Theme(type: .light, colors: .light)
    static let dark = Theme(type: .dark, colors: .dark)
}

protocol Themeable: class {
    func apply(theme: Theme)
}

extension UIColor {
    static func createColor(lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else {
            return lightMode
        }
        return UIColor { (traitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightMode : darkMode
        }
    }
}
