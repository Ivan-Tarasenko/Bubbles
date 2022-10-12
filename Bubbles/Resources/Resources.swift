//
//  Resourses.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 10.10.2022.
//

import Foundation
import UIKit

enum R {
    enum Menu {
        enum Color {
            static let buttonSelect = UIColor(red: 0.4118, green: 0.5837, blue: 0.2667, alpha: 1)
            static let buttonUnselect = UIColor(red: 0.4118, green: 0.6980, blue: 0.2667, alpha: 1)

        }

        enum Title {
            static let training = NSLocalizedString("Training", comment: "Button menu 1")
            static let game = NSLocalizedString("Game", comment: "Button menu 2")
            static let exit = NSLocalizedString("Exit", comment: "Button menu 3")
        }
    }

    enum Fonts {
        static func sfProDisplay(style: sfProDisplay, size: CGFloat) -> UIFont? {
            let sfProDisplayRegular = UIFont(name: "SFProDisplay-Regular", size: size)
            let sfProDisplayBolt = UIFont(name: "SFProDisplay-Bold", size: size)
            switch style {
            case .regular:
                return sfProDisplayRegular
            case .bolt:
                return sfProDisplayBolt
            }
        }
    }
}

enum sfProDisplay {
    case regular
    case bolt
}
