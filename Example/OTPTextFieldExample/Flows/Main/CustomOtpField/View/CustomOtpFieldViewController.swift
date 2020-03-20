//
//  CustomOtpFieldViewController.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

final class CustomOtpFieldViewController: UIViewController {

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
    }

}

// MARK: - Configuration

private extension CustomOtpFieldViewController {

    func configureNavigationBar() {
        title = OTPFieldType.custom.title
    }

}
