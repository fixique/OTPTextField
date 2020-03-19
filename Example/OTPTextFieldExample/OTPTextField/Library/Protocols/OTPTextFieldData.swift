//
//  OTPTextFieldData.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 19.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

/// Protocol for create OTPTextField  custom data adapter
public protocol OTPTextFieldData: class {
    /// Should return number of pins
    func numberOfPins() -> Int
    /// Should return view for current pin at index
    func otpTextField(viewAt index: Int) -> PinContainer
    /// Should return size for pin at index
    func otpTextField(sizeForViewAt index: Int) -> CGSize
    /// Should return space between pins
    func otpTextField(spaceForViewAt index: Int) -> CGFloat
}
