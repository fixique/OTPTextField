//
//  CustomOtpFieldModuleConfigurator.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

final class CustomOtpFieldModuleConfigurator {

    func configure() -> (UIViewController, CustomOtpFieldModuleOutput) {
        let view = CustomOtpFieldViewController()
        let presenter = CustomOtpFieldPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
