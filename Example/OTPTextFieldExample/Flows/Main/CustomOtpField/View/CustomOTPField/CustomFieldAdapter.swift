//
//  CustomFieldAdapter.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 20.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit
import OTPTextField
import SurfUtils

final class CustomFieldAdapter: NSObject {

    // MARK: - Constants

    private enum Constants {
        static let numberOfPins = 4
        static let pinSize = CGSize(width: 40, height: 62)
        static let space: CGFloat = 10
    }

}

// MARK: - OTPTextFieldData

extension CustomFieldAdapter: OTPTextFieldData {

    public func numberOfPins() -> Int {
        return Constants.numberOfPins
    }

    public func otpTextField(viewAt index: Int) -> PinContainer {
        guard let pinView = CustomPinView.loadFromNib() as? PinContainer else {
            fatalError("Can't find class for init pinField")
        }
        return pinView
    }

    public func otpTextField(sizeForViewAt index: Int) -> CGSize {
        return Constants.pinSize
    }

    public func otpTextField(spaceForViewAt index: Int) -> CGFloat {
        return Constants.space
    }

}
