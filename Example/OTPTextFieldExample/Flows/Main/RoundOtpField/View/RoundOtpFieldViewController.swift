//
//  RoundOtpFieldViewController.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

final class RoundOtpFieldViewController: UIViewController {

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
    }

}

// MARK: - Configuration

private extension RoundOtpFieldViewController {

    func configureNavigationBar() {
        title = OTPFieldType.round.title
    }

}
