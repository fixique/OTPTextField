//
//  UIView.swift
//  OTPTextField
//
//  Created by Vladislav Krupenko on 19.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

extension UIView {

    static func loadFromNib<T: UIView>() -> T {
        let bundle = Bundle(for: self)
        let nibName = String(describing: self)
        let nib = UINib(nibName: nibName, bundle: bundle)

        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            return T()
        }

        return view
    }

}
