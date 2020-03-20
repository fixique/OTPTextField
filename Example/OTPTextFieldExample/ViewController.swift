//
//  ViewController.swift
//  OTPTextFieldExample
//
//  Created by Vladislav Krupenko on 19.03.2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit
import OTPTextField

class ViewController: UIViewController {

    @IBOutlet private weak var textField: OTPTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = OTPFieldConfiguration(adapter: RoundTextFieldAdapter(),
                                                  keyboardType: .namePhonePad,
                                                  keyboardAppearance: .dark,
                                                  autocorrectionType: .no,
                                                  allowedCharactersSet: .alphanumerics)
        textField.setConfiguration(configuration)
    }


}

