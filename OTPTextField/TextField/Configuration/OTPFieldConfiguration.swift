//
//  OTPFieldConfiguration.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 19.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

public struct OTPFieldConfiguration {

    // MARK: - Public Properties

    public let adapter: OTPTextFieldData
    public let keyboardType: UIKeyboardType
    public let keyboardAppearance: UIKeyboardAppearance
    public let autocorrectionType: UITextAutocorrectionType
    public let allowedCharactersSet: CharacterSet

    // MARK: - Initialization

    public init(adapter: OTPTextFieldData,
                keyboardType: UIKeyboardType = .numberPad,
                keyboardAppearance: UIKeyboardAppearance = .light,
                autocorrectionType: UITextAutocorrectionType = .no,
                allowedCharactersSet: CharacterSet = .alphanumerics) {
        self.adapter = adapter
        self.keyboardType = keyboardType
        self.keyboardAppearance = keyboardAppearance
        self.autocorrectionType = autocorrectionType
        self.allowedCharactersSet = allowedCharactersSet
    }

}
