//
//  PinContainer.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 19.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

/// Protocol for create custom pin view and use it with OTPTextField adapater
public protocol PinContainer: class {
    /// Property return instance of current view
    var view: UIView { get }
    /// Method for set character value for view
    func set(value: String?)
    /// Remove characters from view
    func clear()
    /// Method for pin states update.
    ///
    /// Each pin has two states: active or inactive, error state or not.
    /// When implementing a pin, everyone have to decide for himself:
    /// what is more important - an error state or an active state?
    /// Depending on the answer to this question, implement the display logic.
    /// And in order not to store the state inside the view -
    /// this method returns the current state of the object for both states.
    /// - Parameters:
    ///     - isActive: true if target pin is active, false if not
    ///     - isError: true if all OTP-filed has error-state in this moment, false if not
    func setupState(isActive: Bool, isError: Bool)
}

public extension PinContainer where Self: UIView {

    var view: UIView {
        return self
    }

}
