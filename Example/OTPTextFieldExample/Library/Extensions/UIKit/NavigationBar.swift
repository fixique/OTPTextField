//
//  NavigationBar.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 20.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

extension UINavigationBar {

    func applyWhiteStyle() {
        barTintColor = Colors.Figma.defaultBackground
        tintColor = Colors.Figma.defaultRed
        titleTextAttributes = [
            .foregroundColor: Colors.Figma.defaultText,
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold)
        ]
        barStyle = .default
        backIndicatorImage = UIImage(asset: Asset.iconBackLeft)
        backIndicatorTransitionMaskImage = UIImage(asset: Asset.iconBackLeft)
    }

}
