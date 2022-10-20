//
//  File.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 12.10.2022.
//

import UIKit

class TrainingViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playingFieldView: UIView!

    @IBOutlet var bubbles: [CircleView]!

    let model = TrainingViewModel()
    var test = Set<Int>()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func panAction(_ gesture: UIPanGestureRecognizer) {

        var tag: Int {
            get {
                return gesture.view?.tag ?? 0
            }
            set {
                gesture.view?.tag = newValue
            }
        }

        var frames = model.allFrames(from: bubbles)
        model.setPanAction(for: view, gesture)
        frames.removeValue(forKey: tag)

        test.insert(tag)

        var ttt:CGFloat = 0.0

        for int in 0...test.count {
            print("int \(int)")
            ttt += 0.3
            print("ttt \(ttt)")
        }

        switch gesture.state {
        case .changed:
            model.interactionView(bubbles, frames: frames, tag: tag) { [self] key in

                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8) { [self] in
                    bubbles[key].transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                    bubbles[key].circleView.backgroundColor = R.BubbleColor.Training.enlargedBubble
                    bubbles[tag].transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                } completion: { _ in
                    self.bubbles[tag].isHidden = true

                }

                print(self.test)





                if !self.test.contains(key) {
                    UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8) { [self] in



                        self.bubbles[key].transform = CGAffineTransform(scaleX: 1.3 + ttt, y: 1.3 + ttt)
                    }
                }

            }
        default: break
        }
    }
}
