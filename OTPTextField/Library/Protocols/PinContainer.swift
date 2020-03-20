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
    /// Method should implement error state
    func setError()
    /// Method should remove error state
    func removeError()
    /// Remove characters from view
    func clear()
    /// Method for animate view indicator
    func animateIndicator()
    /// Method will be remove indicator from current view before set characters
    func removeIndicator()
}

public extension PinContainer where Self: UIView {

    var view: UIView {
        return self
    }

}
