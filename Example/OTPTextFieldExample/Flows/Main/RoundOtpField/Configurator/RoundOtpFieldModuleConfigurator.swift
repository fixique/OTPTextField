//
//  RoundOtpFieldModuleConfigurator.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

final class RoundOtpFieldModuleConfigurator {

    func configure() -> (UIViewController, RoundOtpFieldModuleOutput) {
        let view = RoundOtpFieldViewController()
        let presenter = RoundOtpFieldPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
