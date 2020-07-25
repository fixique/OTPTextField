//
//  PlainOTPFieldAdapter.swift
//  OTPTextFieldExample
//
//  Created by Александр Чаусов on 25/07/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit
import SFOTPTextField

final class PlainOTPFieldAdapter: NSObject {

    // MARK: - Constants

    private enum Constants {
        static let numberOfPins = 6
        static let pinSize = CGSize(width: 32, height: 32)
        static let space: CGFloat = 0
    }

}

// MARK: - OTPTextFieldData

extension PlainOTPFieldAdapter: OTPTextFieldData {

    public func numberOfPins() -> Int {
        return Constants.numberOfPins
    }

    public func otpTextField(viewAt index: Int) -> PinContainer {
        guard let pinView = PlainPinView.loadFromNib() as? PinContainer else {
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
