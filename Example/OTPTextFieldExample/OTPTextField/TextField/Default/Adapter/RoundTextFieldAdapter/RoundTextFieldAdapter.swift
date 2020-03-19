//
//  RoundTextFieldAdapter.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 19.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

public final class RoundTextFieldAdapter: NSObject {

    // MARK: - Constants

    private enum Constants {
        static let numberOfPins = 6
        static let pinSize = CGSize(width: 44, height: 44)
        static let space: CGFloat = 6
    }

    // MARK: - Inititalization

    override public init() {}

}

// MARK: - OTPTextFieldData

extension RoundTextFieldAdapter: OTPTextFieldData {

    public func numberOfPins() -> Int {
        return Constants.numberOfPins
    }

    public func otpTextField(viewAt index: Int) -> PinContainer {
        guard let pinView = RoundPinView.loadFromNib() as? PinContainer else {
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
