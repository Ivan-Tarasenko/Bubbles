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

        var isPositionUpdated: Bool = true
        let gestureTransition = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }

        if isPositionUpdated {
            gestureView.center = CGPoint(x: gestureView.center.x + gestureTransition.x,
                                         y: gestureView.center.y + gestureTransition.y)
        }

        gesture.setTranslation(.zero, in: view)

        // Сhecking the position of the round view. If the views go beyond the boundaries of the playing field, the position update stops
        if gestureView.frame.minY <= playingFieldView.bounds.minY {
            isPositionUpdated = false
            animation {
                gestureView.center = CGPoint(
                    x: gestureView.center.x,
                    y: gestureView.frame.height / 2)
            }
        }
        if gestureView.frame.minX <= playingFieldView.bounds.minX {
            isPositionUpdated = false
            animation {
                gestureView.center = CGPoint(
                    x: gestureView.frame.width / 2,
                    y: gestureView.center.y)
            }
        }
        if gestureView.frame.maxY >= playingFieldView.bounds.maxY {
            isPositionUpdated = false
            animation {
                gestureView.center = CGPoint(
                    x: gestureView.center.x,
                    y: self.playingFieldView.frame.height - (gestureView.frame.height / 2))
            }
        }
        if gestureView.frame.maxX >= playingFieldView.bounds.maxX {
            isPositionUpdated = false
            animation {
                gestureView.center = CGPoint(
                    x: self.playingFieldView.frame.width - (gestureView.frame.width / 2),
                    y: gestureView.center.y)
            }
        }

        var frames =  allFrames(from: bubbles)
        frames.removeValue(forKey: gestureView.tag)

        switch gesture.state {
        case .changed, .ended:
            interactionView(bubbles, frames: frames, tag: gestureView.tag) { [self] key in

                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8) { [self] in

                    bubbles[key].transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                    bubbles[key].circleView.backgroundColor = R.BubbleColor.Training.enlargedBubble
                    gestureView.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
                    score.insert(gestureView.tag)
                }
            }
        default:
            break
        }
        scoreLabel.text = "Score: \(score.count)"
    }

    /// Creating a dictionary from the minimum and maximum value ranges of frames from the view array
    /// - Parameter views: array of view elements
    /// - Returns: A dictionary with an Int type key and a value in the form of an array of two elements, a frame range of X and Y
    func allFrames(from views: [UIView]) -> [Int: [ClosedRange<Int>]] {

        var frames = [Int: [ClosedRange<Int>]]()
        for (index, view) in views.enumerated() {

            let rangeFrameY = (Int(view.frame.minY)...Int(view.frame.maxY))
            let rangeFrameX = (Int(view.frame.minX)...Int(view.frame.maxX))

            frames[index] = [rangeFrameY, rangeFrameX]
        }
        return frames
    }

    /// A method for processing the interaction between views when they come into contact
    /// - Parameters:
    ///   - views: array of all views
    ///   - frames: a dictionary in which the value is an array of frame ranges along the X and Y axes
    ///   - tag: tag of the element
    ///   - completion: processing actions when elements come into contact
    func interactionView(_ views: [UIView], frames: [Int: [ClosedRange<Int>]], tag: Int, completion: @escaping (Int) -> Void) {
        for (key, value) in frames {

            for rangeY in value[0] {
                if Int(views[tag].frame.origin.y) == rangeY ||
                    Int(views[tag].frame.origin.y + views[tag].frame.height) == rangeY {

                    for rangeX in value[1] {
                        if Int(views[tag].frame.origin.x) == rangeX ||
                            Int(views[tag].frame.origin.x + views[tag].frame.width) == rangeX {
                            completion(key)
                        }
                    }
                }
            }
        }
    }

    func animation(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1) {
            completion()
        }
    }

}
