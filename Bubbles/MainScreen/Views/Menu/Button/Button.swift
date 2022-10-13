//
//  Buttons.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 10.10.2022.
//

import UIKit

class MenuButton: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setButton()
    }

    override open var isHighlighted: Bool {
             didSet {
                 backgroundColor = isHighlighted ? R.Menu.Color.buttonSelect : R.Menu.Color.buttonUnselect
             }
         }

    func setButton() {
        titleLabel?.font = R.Fonts.sfProDisplay(style: .bolt, size: 25)
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.darkGray.cgColor
    }
}
