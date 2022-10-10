//
//  Buttons.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 10.10.2022.
//

import UIKit

class MenuButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setButton() {
        self.titleLabel?.font = R.Fonts.sfProDisplay(style: .bolt, size: 25)
    }
}
