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
    var score = Set<Int>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setPlayingField()
    }

    func setPlayingField() {
        playingFieldView.backgroundColor = R.PlayingField.Color.field
        playingFieldView.layer.borderColor = UIColor.black.cgColor
        playingFieldView.layer.borderWidth = 1
        playingFieldView.layer.cornerRadius = 13
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

        model.setPanAction(for: view, gesture)

        var frames = model.allFrames(from: bubbles)
        frames.removeValue(forKey: tag)

        switch gesture.state {
        case .changed, .ended:
            model.interactionView(bubbles, frames: frames, tag: tag) { [self] key in

                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8) { [self] in
                    bubbles[key].transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                    bubbles[key].circleView.backgroundColor = R.BubbleColor.Training.enlargedBubble
                    bubbles[tag].transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                    score.insert(tag)
                } completion: { [self] _ in
                    bubbles[tag].isHidden = true
                }
            }
        default:
            break
        }
        scoreLabel.text = "Score: \(score.count)"
    }
}
