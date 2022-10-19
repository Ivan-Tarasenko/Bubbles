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

        // ----------------------------------------------------------------------

        guard let tag = gesture.view?.tag else { return }

        print(tag)

        var frameX = (Int(bubbles[0].frame.minX)...Int(bubbles[0].frame.maxX))
        var frameY = (Int(bubbles[0].frame.minY)...Int(bubbles[0].frame.maxY))

        print("\(frameX) frame X")
        print("\(frameY) frame Y")

        print("Y bubble \(tag) ///// \(bubbles[tag].frame.origin.y)")

        // -----------------

        for value in frameY {
            if Int(bubbles[tag].frame.origin.y) == value ||
                Int(bubbles[tag].frame.origin.y + bubbles[tag].frame.height) == value {

                print("X bubble \(tag) ///// \(bubbles[tag].frame.origin.x)")

                for value in frameX {
                    if Int(bubbles[tag].frame.origin.x) == value ||
                        Int(bubbles[tag].frame.origin.x + bubbles[tag].frame.width) == value {
                        bubbles[0].circleView.backgroundColor = .systemPurple
                    }
                }
            }
        }

        // --------------------

    }


    @IBAction func view2(_ gesture: UIPanGestureRecognizer) {

        //        let gestureTransition = gesture.translation(in: view)
        //        guard let gestureView = gesture.view else { return }
        //
        //        gestureView.center = CGPoint(x: gestureView.center.x + gestureTransition.x,
        //                                     y: gestureView.center.y + gestureTransition.y)
        //
        //        gesture.setTranslation(.zero, in: view)
        //        guard gesture.state == .ended else { return }
        //
        //
        //        let view7Frame = view7.frame
        //        let view6Frame = view6.frame
        //
        //        for value in Int(view7Frame.minY)...Int(view7Frame.maxY) {
        //            if Int(view6Frame.origin.y) == value {
        //                view7.circleView.backgroundColor = .systemPurple
        //                print("eys")
        //            }
        //        }

    }
    @IBAction func but(_ sender: Any) {
        bubbles[0].circleView.backgroundColor = .systemBlue

    }
}
