//
//  Resourses.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 10.10.2022.
//

import Foundation
import UIKit

enum R {
    enum PlayingField {
        enum Color {
            static let field = UIColor(hexString: "FFC694")
        }
    }
    enum BubbleColor {
        enum Training {
            static let initialBubble = UIColor(hexString: "4186D3")
            static let enlargedBubble = UIColor(hexString: "0D55A6")
        }
    }
    enum Menu {
        enum Color {
            static let buttonSelect = UIColor(hexString: "2C5907")
            static let buttonUnselect = UIColor(hexString: "4B8917") 
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
