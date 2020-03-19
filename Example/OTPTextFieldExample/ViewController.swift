//
//  ViewController.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 19.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var otpTextField: OTPTextField!
    @IBOutlet private weak var roundTextField: OTPTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = OTPFieldConfiguration(adapter: DefaultTextFieldAdapter())
        otpTextField.setConfiguration(configuration)

        otpTextField.onBeginEditing = {
            print("become active")
        }
        otpTextField.onEndEditing = {
            print("end editing")
        }
        otpTextField.onOTPEnter = { otpCode in
            print("OTP entered: \(otpCode)")
        }

        let roundConfiguration = OTPFieldConfiguration(adapter: RoundTextFieldAdapter(),
                                                       keyboardType: .namePhonePad,
                                                       keyboardAppearance: .dark,
                                                       autocorrectionType: .no,
                                                       allowedCharactersSet: .alphanumerics)
        roundTextField.setConfiguration(roundConfiguration)
    }


}

