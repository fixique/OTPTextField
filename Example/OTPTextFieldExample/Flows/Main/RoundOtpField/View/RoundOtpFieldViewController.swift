//
//  RoundOtpFieldViewController.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit
import SFOTPTextField

final class RoundOtpFieldViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var otpField: OTPTextField!

    // MARK: - Properties

    var output: RoundOtpFieldViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - RoundOtpFieldViewInput

extension RoundOtpFieldViewController: RoundOtpFieldViewInput {

    func setupInitialState() {
        configureNavigationBar()
        configureDescription()
        configureOtpField()
    }

}

// MARK: - Configuration

private extension RoundOtpFieldViewController {

    func configureNavigationBar() {
        title = OTPFieldType.round.title
    }

    func configureDescription() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        descriptionLabel.textColor = Colors.Figma.defaultText
        descriptionLabel.text = OTPFieldType.round.description
        descriptionLabel.numberOfLines = 0
    }

    func configureOtpField() {
        let configuration = OTPFieldConfiguration(adapter: RoundTextFieldAdapter(),
                                                  keyboardType: .namePhonePad,
                                                  keyboardAppearance: .light,
                                                  autocorrectionType: .no,
                                                  allowedCharactersSet: .alphanumerics)
        otpField.setConfiguration(configuration)
        otpField.onOTPEnter = { [weak self] otpCode in
            guard otpCode != OTPFieldType.round.password else {
                return
            }
            self?.otpField.setError()
        }
        otpField.onTextChanged = { [weak self] code in
            self?.otpField.removeError()
        }
    }

}

// MARK: - Actions

private extension RoundOtpFieldViewController {

    @IBAction private func hideKeyboardDidPressed(_ sender: Any) {
        view.endEditing(true)
    }

}
