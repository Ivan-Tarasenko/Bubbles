//
//  ButtonMenu.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 11.10.2022.
//

import UIKit

class Menu: UIView {

    @IBOutlet weak var menuButton: MenuButton!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        getView()
       
    }

    // Create view from xib
    func getView() {
        guard let view = loadViewFromNib(nibName: "Menu") else { return }
        view.frame = bounds
        addSubview(view)
    }

}
