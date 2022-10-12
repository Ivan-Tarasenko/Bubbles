//
//  CircleView.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 12.10.2022.
//

import UIKit

class CircleView: UIView {

    var circleView: UIView!

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }

    func getView() -> UIView {
        guard let view = loadViewFromNib(nibName: "CircleView") else { return UIView() }
        return view

    }

    func setView() {
        circleView = getView()
        circleView.frame = bounds
        circleView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        circleView.layer.cornerRadius = circleView.frame.width / 2
        circleView.layer.borderWidth = 3
        circleView.layer.borderColor = UIColor.darkGray.cgColor
        backgroundColor = .clear

        addSubview(circleView)
    }
}
