//
//  Resourses.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 10.10.2022.
//

import Foundation
import UIKit

enum R {
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
