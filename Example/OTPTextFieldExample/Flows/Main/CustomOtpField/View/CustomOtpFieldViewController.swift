//
//  CustomOtpFieldViewController.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit
import OTPTextField

final class CustomOtpFieldViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var otpField: OTPTextField!

    // MARK: - Properties

    var output: CustomOtpFieldViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - CustomOtpFieldViewInput

extension CustomOtpFieldViewController: CustomOtpFieldViewInput {

    func setupInitialState() {
        configureNavigationBar()
        configureDescription()
        configureOtpField()
    }

}

// MARK: - Configuration

private extension CustomOtpFieldViewController {

    func configureNavigationBar() {
        title = OTPFieldType.custom.title
    }

    func configureDescription() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        descriptionLabel.textColor = Colors.Figma.defaultText
        descriptionLabel.text = OTPFieldType.custom.description
        descriptionLabel.numberOfLines = 0
    }

    func configureOtpField() {
        let configuration = OTPFieldConfiguration(adapter: CustomFieldAdapter())
        otpField.setConfiguration(configuration)
        otpField.onOTPEnter = { [weak self] otpCode in
            guard otpCode != OTPFieldType.custom.password else {
                return
            }
            self?.otpField.clear()
            self?.otpField.setError()
        }
        otpField.onTextChanged = { [weak self] code in
            self?.otpField.removeError()
        }
    }

}
