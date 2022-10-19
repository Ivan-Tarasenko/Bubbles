//
//  TrainingViewModel.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 18.10.2022.
//

import UIKit

class TrainingViewModel {

    func interactionView(_ views:[UIView], tag: Int) {

        var frameX = (Int(views[0].frame.minX)...Int(views[0].frame.maxX))
        var frameY = (Int(views[0].frame.minY)...Int(views[0].frame.maxY))

        //               print("\(frameX) frame X")
        //               print("\(frameY) frame Y")
        //
        //               print("Y bubble \(tag) ///// \(views[tag].frame.origin.y)")
        //
        //               // -----------------

        for value in frameY {
            if Int(views[tag].frame.origin.y) == value ||
                Int(views[tag].frame.origin.y + views[tag].frame.height) == value {

                //                       print("X bubble \(tag) ///// \(views[tag].frame.origin.x)")

                for value in frameX {
                    if Int(views[tag].frame.origin.x) == value ||
                        Int(views[tag].frame.origin.x + views[tag].frame.width) == value {


//                        views[0].circleView.backgroundColor = .systemPurple


                    }
                }
            }
        }
    }
    
}
