//
//  DefaultOtpFieldPresenter.swift
//  OTPTextFieldExample
//
//  Created by Krupenko Validislav on 20/03/2020.
//  Copyright © 2020 Fixique. All rights reserved.
//

final class DefaultOtpFieldPresenter: DefaultOtpFieldModuleOutput {

    // MARK: - DefaultOtpFieldModuleOutput

    // MARK: - Properties

    weak var view: DefaultOtpFieldViewInput?

}

// MARK: - DefaultOtpFieldModuleInput

extension DefaultOtpFieldPresenter: DefaultOtpFieldModuleInput {
}

// MARK: - DefaultOtpFieldViewOutput

extension DefaultOtpFieldPresenter: DefaultOtpFieldViewOutput {

    func viewLoaded() {
        view?.setupInitialState()
    }

}
