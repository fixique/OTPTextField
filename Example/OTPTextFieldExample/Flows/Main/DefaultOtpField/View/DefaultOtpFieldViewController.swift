//
//  DefaultOtpFieldViewController.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit
import OTPTextField

final class DefaultOtpFieldViewController: UIViewController {

    // MARK: - IBOutels

    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var otpField: OTPTextField!
    @IBOutlet private weak var errorLabel: UILabel!

    // MARK: - Properties

    var output: DefaultOtpFieldViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - DefaultOtpFieldViewInput

extension DefaultOtpFieldViewController: DefaultOtpFieldViewInput {

    func setupInitialState() {
        configureNavigationBar()
        configureDescription()
        configureOtpField()
        configureErrorLabel()
    }

}

// MARK: - Configuration

private extension DefaultOtpFieldViewController {

    func configureNavigationBar() {
        title = OTPFieldType.default.title
    }

    func configureDescription() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        descriptionLabel.textColor = Colors.Figma.defaultText
        descriptionLabel.text = OTPFieldType.default.description
        descriptionLabel.numberOfLines = 0
    }

    func configureOtpField() {
        otpField.onBeginEditing = {
            print("Did begin editing")
        }
        otpField.onOTPEnter = { [weak self] otpCode in
            guard otpCode == OTPFieldType.default.password else {
                self?.errorLabel.text = L10n.Errors.iccorectPassword
                self?.errorLabel.isHidden = false
                return
            }
            self?.errorLabel.isHidden = false
            self?.errorLabel.text = L10n.Errors.correctPassword
        }
        otpField.onTextChanged = { [weak self] text in
            self?.errorLabel.isHidden = true
        }
    }

    func configureErrorLabel() {
        errorLabel.textColor = Colors.Figma.defaultRed
        errorLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        errorLabel.text = nil
    }

}
