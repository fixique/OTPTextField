//
//  CustomOtpFieldPresenter.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

final class CustomOtpFieldPresenter: CustomOtpFieldModuleOutput {

    // MARK: - CustomOtpFieldModuleOutput

    // MARK: - Properties

    weak var view: CustomOtpFieldViewInput?

}

// MARK: - CustomOtpFieldModuleInput

extension CustomOtpFieldPresenter: CustomOtpFieldModuleInput {
}

// MARK: - CustomOtpFieldViewOutput

extension CustomOtpFieldPresenter: CustomOtpFieldViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
