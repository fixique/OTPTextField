//
//  DefaultTextFieldAdapter.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 19.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

public final class DefaultTextFieldAdapter: NSObject {

    // MARK: - Constants

    private enum Constants {
        static let numberOfPins = 4
        static let pinSize = CGSize(width: 56.0, height: 48.0)
        static let space: CGFloat = 16.0
    }

    // MARK: - Initialization

    override public init() {}

}

// MARK: - OTPTextFieldData

extension DefaultTextFieldAdapter: OTPTextFieldData {

    public func numberOfPins() -> Int {
        return Constants.numberOfPins
    }

    public func otpTextField(viewAt index: Int) -> PinContainer {
        guard let pinView = DefaultPinView.loadFromNib() as? PinContainer else {
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
