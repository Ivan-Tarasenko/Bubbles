//
//  TrainingViewModel.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 18.10.2022.
//

import UIKit

class TrainingViewModel {

    /// Setting pan gesture recognizer
    /// - Parameters:
    ///   - view: UIView
    ///   - sender: UIPanGestureRecognizer
    func setPanAction(for view: UIView, _ sender: UIPanGestureRecognizer ) {
        let gestureTransition = sender.translation(in: view)
        guard let gestureView = sender.view else { return }

        gestureView.center = CGPoint(x: gestureView.center.x + gestureTransition.x,
                                     y: gestureView.center.y + gestureTransition.y)

        sender.setTranslation(.zero, in: view)
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
}
