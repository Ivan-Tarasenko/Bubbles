//
//  File.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 12.10.2022.
//

import UIKit

class TrainingViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func panAction(_ gesture: UIPanGestureRecognizer) {
        let gestureTransition = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }

        gestureView.center = CGPoint(x: gestureView.center.x + gestureTransition.x,
                                     y: gestureView.center.y + gestureTransition.y)

        gesture.setTranslation(.zero, in: view)

        guard gesture.state == .ended else { return }

        print("view paned")
    }
}
