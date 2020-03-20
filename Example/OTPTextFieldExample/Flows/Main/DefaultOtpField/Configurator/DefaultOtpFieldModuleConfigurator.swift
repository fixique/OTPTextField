//
//  DefaultOtpFieldModuleConfigurator.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

final class DefaultOtpFieldModuleConfigurator {

    func configure() -> (UIViewController, DefaultOtpFieldModuleOutput) {
        let view = DefaultOtpFieldViewController()
        let presenter = DefaultOtpFieldPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
