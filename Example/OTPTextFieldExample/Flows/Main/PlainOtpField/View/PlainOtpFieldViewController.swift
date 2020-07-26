//
//  PlainOtpFieldViewController.swift
//  OTPTextFieldExample
//
//  Created by Александр Чаусов on 25/07/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit
import SFOTPTextField

final class PlainOtpFieldViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var otpField: OTPTextField!

    // MARK: - Properties

    var output: PlainOtpFieldViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - PlainOtpFieldViewInput

extension PlainOtpFieldViewController: PlainOtpFieldViewInput {

    func setupInitialState() {
        configureNavigationBar()
        configureDescription()
        configureOtpField()
    }

}

// MARK: - Configuration

private extension PlainOtpFieldViewController {

    func configureNavigationBar() {
        title = OTPFieldType.plain.title
    }

    func configureDescription() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        descriptionLabel.textColor = Colors.Figma.defaultText
        descriptionLabel.text = OTPFieldType.plain.description
        descriptionLabel.numberOfLines = 0
    }

    func configureOtpField() {
        let configuration = OTPFieldConfiguration(adapter: PlainOTPFieldAdapter())
        otpField.setConfiguration(configuration)
        otpField.onOTPEnter = { [weak self] otpCode in
            guard otpCode != OTPFieldType.plain.password else {
                return
            }
            self?.otpField.clear()
            self?.otpField.setError()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                self?.otpField.removeError()
            }
        }
        otpField.onTextChanged = { [weak self] code in
            self?.otpField.removeError()
        }
    }

}
