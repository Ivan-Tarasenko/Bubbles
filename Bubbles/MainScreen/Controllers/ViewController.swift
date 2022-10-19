//
//  ViewController.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 10.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trainingButton: Menu!
    @IBOutlet weak var gameButton: Menu!
    @IBOutlet weak var exitButton: Menu!

    override func viewDidLoad() {
        super.viewDidLoad()
       setButtonsMenu()
        trainingButtonPressed()
        gameButtonPressed()
        exitButtonPressed()
    }

    func setButtonsMenu() {
        trainingButton.menuButton.backgroundColor = R.Menu.Color.buttonUnselect
        trainingButton.menuButton.setTitle(R.Menu.Title.training, for: .normal)

        gameButton.menuButton.backgroundColor = R.Menu.Color.buttonUnselect
        gameButton.menuButton.setTitle(R.Menu.Title.game, for: .normal)

        exitButton.menuButton.backgroundColor = R.Menu.Color.buttonUnselect
        exitButton.menuButton.setTitle(R.Menu.Title.exit, for: .normal)
    }

    func trainingButtonPressed() {
        trainingButton.menuButton.buttonAction = {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let trainitgVC = storyBoard.instantiateViewController(withIdentifier: "Training") as? TrainingViewController ?? UIViewController()

            trainitgVC.modalPresentationStyle = .fullScreen
            trainitgVC.modalTransitionStyle = .coverVertical

            self.show(trainitgVC, sender: nil)

        }
    }

    func gameButtonPressed() {
        gameButton.menuButton.buttonAction = {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let gameVC = storyBoard.instantiateViewController(withIdentifier: "Game") as? GameViewController ?? UIViewController()

            gameVC.modalPresentationStyle = .fullScreen
            gameVC.modalTransitionStyle = .coverVertical

            self.show(gameVC, sender: nil)
        }
    }

    func exitButtonPressed() {
        exitButton.menuButton.buttonAction = {
            print("exit press")
            exit(0)
        }
    }
}
