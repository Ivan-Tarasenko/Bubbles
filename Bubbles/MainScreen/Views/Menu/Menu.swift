//
//  ButtonMenu.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 11.10.2022.
//

import UIKit

@IBDesignable
class Menu: UIView {

    @IBOutlet weak var menuButton: MenuButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        getView()
    }
    
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
