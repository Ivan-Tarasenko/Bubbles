//
//  GameViewController.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 12.10.2022.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playingFieldView: UIView!

    override func viewDidLoad() {
     super.viewDidLoad()
        view.backgroundColor = .systemPurple
    }
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
