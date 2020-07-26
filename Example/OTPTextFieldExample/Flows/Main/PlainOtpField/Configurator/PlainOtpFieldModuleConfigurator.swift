//
//  PlainOtpFieldModuleConfigurator.swift
//  OTPTextFieldExample
//
//  Created by Александр Чаусов on 25/07/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

import UIKit

final class PlainOtpFieldModuleConfigurator {

    func configure() -> (UIViewController, PlainOtpFieldModuleOutput) {
        let view = PlainOtpFieldViewController()
        let presenter = PlainOtpFieldPresenter()

        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
