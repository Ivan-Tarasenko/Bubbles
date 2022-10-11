//
//  UIView+LoadNib.swift
//  Bubbles
//
//  Created by Иван Тарасенко on 11.10.2022.
//

import UIKit

extension UIView {

    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
