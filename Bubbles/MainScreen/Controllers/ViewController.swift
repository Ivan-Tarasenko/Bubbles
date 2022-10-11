//
//  ViewController.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 10.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttons: [Menu]!

    override func viewDidLoad() {
        super.viewDidLoad()
       setButtonsMenu()
    }

    func setButtonsMenu() {
        guard !buttons.isEmpty else { return }

        let training = buttons[0]
        let game = buttons[1]
        let exit = buttons[2]

        training.menuButton.backgroundColor = R.Menu.Color.buttonUnselect
        training.menuButton.setTitle(R.Menu.Title.training, for: .normal)

        game.menuButton.backgroundColor = R.Menu.Color.buttonUnselect
        game.menuButton.setTitle(R.Menu.Title.game, for: .normal)

        exit.menuButton.backgroundColor = R.Menu.Color.buttonUnselect
        exit.menuButton.setTitle(R.Menu.Title.exit, for: .normal)
    }
}
